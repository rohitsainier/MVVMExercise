//
//  HomeViewModel.swift
//  MVVMExercise
//
//  Created by Rohit Saini on 28/02/21.
//

import UIKit

protocol DetailDelegate {
    func didUpdateUsersData(user: User)
}

protocol HomeDelegate {
    func didLoadUsers()
    func didErrorInLoadingUsers(msg:String)
}

protocol HomeUseCases {
    func fetchUsers(session: URLSession)
    func updateUserById(user:User)
}

class HomeViewModel{
    var users: [User] = [User]()
    var delegate:HomeDelegate?
}

extension HomeViewModel:HomeUseCases{
    func updateUserById(user: User) {
        if let index = users.firstIndex(where: {$0.id == user.id}){
            users[index] = user
            delegate?.didLoadUsers()
        }
    }
    
    func fetchUsers(session: URLSession = .shared){
        session.request(.users, using: Void()) { [weak self] (result) in
            guard let `self` = self else{return}
            switch result{
            case .success(let response):
                print(response)
                self.users = response
                self.delegate?.didLoadUsers()
            case .failure(let err):
                print(err)
                self.delegate?.didErrorInLoadingUsers(msg: err.localizedDescription)
            }
        }
    }
}
