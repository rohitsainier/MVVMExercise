//
//  HomeViewModel.swift
//  MVVMExercise
//
//  Created by Rohit Saini on 28/02/21.
//

import Foundation

protocol HomeDelegate {
    func didUsersLoaded()
    func didErrorInLoadingUsers(msg:String)
}

class HomeViewModel{
    var users: [User] = [User]()
    var delegate:HomeDelegate?
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
