//
//  HomeCell.swift
//  VIPERExercise
//
//  Created by Rohit Saini on 28/02/21.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var cmpLbl: UILabel!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(user: User){
        nameLbl.text = user.name
        phoneLbl.text = user.phone
        websiteLbl.text = user.website
        cmpLbl.text = user.company?.name
        starImg.image = user.isFavourite ? UIImage(named: "star_selected") : UIImage(named: "star") 
    }
}
