//
//  DetailsViewController.swift
//  VIPERExercise
//
//  Created by Rohit Saini on 28/02/21.
//

import UIKit


class DetailsViewController: UIViewController {
    
    @IBOutlet weak var userDetailsLbl: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var cmpLbl: UILabel!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    var user: User!
    var delegate: DetailDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.didUpdateUsersData(user: user)
    }
    
    private func configUI(){
        userDetailsLbl.text = "\(user.name) Details"
        nameLbl.text = user.name
        usernameLbl.text = user.username
        phoneLbl.text = user.phone
        cmpLbl.text = user.company?.name
        websiteLbl.text = user.website
        starBtn.setImage(user.isFavourite ? UIImage(named: "star_selected")! : UIImage(named: "star")!, for: .normal)
    }
    
    @IBAction func clickStarBtn(_ sender: UIButton) {
        if user.isFavourite{
            user.isFavourite = false
            starBtn.setImage(UIImage(named: "star")!, for: .normal)
        }
        else{
            user.isFavourite = true
            starBtn.setImage(UIImage(named: "star_selected")!, for: .normal)
        }
    }
    
}
