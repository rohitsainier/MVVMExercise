//
//  HomeViewModel.swift
//  MVVMExercise
//
//  Created by Rohit Saini on 28/02/21.
//

import UIKit

protocol HomeDelegate {
    func didUsersLoaded()
    func didErrorInLoadingUsers(msg:String)
}

protocol HomeUseCases {
    func fetchUsers(session: URLSession)
    func naviagateToDetailsVC(SELF: UIViewController,user:User)
}

class HomeViewModel{
    var users: [User] = [User]()
    var delegate:HomeDelegate?
}

extension HomeViewModel:HomeUseCases{
    func naviagateToDetailsVC(SELF:UIViewController,user:User) {
        let vc: DetailsViewController = Storyboard.Main.load.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.user = user
        SELF.navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchUsers(session: URLSession = .shared){
        session.request(.users, using: Void()) { [weak self] (result) in
            guard let `self` = self else{return}
            switch result{
            case .success(let response):
                print(response)
                self.users = response
                self.delegate?.didUsersLoaded()
            case .failure(let err):
                print(err)
                self.delegate?.didErrorInLoadingUsers(msg: err.localizedDescription)
            }
        }
    }
}
