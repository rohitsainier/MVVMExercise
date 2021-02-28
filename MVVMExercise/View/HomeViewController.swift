//
//  ViewController.swift
//  VIPERModule
//
//  Created by Rohit Saini on 27/02/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var homeVM: HomeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
    
    private func configUI(){
        title = "Home"
        homeVM.delegate = self
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        homeVM.fetchUsers()
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeVM.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as? HomeCell else {return UITableViewCell()}
        cell.configureCell(user: homeVM.users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: HomeDelegate {
    func didUsersLoaded() {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else{return}
            self.tableView.reloadData()
        }
    }
    func didErrorInLoadingUsers(msg: String) {
        //Show Error
    }
}
