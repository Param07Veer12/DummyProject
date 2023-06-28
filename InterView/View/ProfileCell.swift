//
//  ProfileCell.swift
//  InterView
//
//  Created by Paramveer Singh on 16/05/22.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet var lblId: UILabel!
    @IBOutlet var imgMain: UIImageView!
    @IBOutlet var lblAge: UILabel!
    @IBOutlet var lblSalary: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var backView: UIView!
    @IBOutlet var viewBackground: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = backView.frame.height / 2
        imgMain.layer.cornerRadius = imgMain.frame.height / 2
        viewBackground.layer.cornerRadius = 6
        backView.clipsToBounds = false
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowOffset = CGSize.zero
        backView.layer.shadowRadius = 3

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
