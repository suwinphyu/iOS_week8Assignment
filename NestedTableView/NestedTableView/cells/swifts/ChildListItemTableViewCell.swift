//
//  ChildListItemTableViewCell.swift
//  NestedTableView
//
//  Created by Su Win Phyu on 9/15/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class ChildListItemTableViewCell: UITableViewCell {

    static let identifier = "ChildListItemTableViewCell"
    
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var imgViewProfile: UIImageView!
    
    
    var child : ChildVO? {
        didSet{
            if let child = child {
                lblStudentName.text = child.childName
                lblGender.text = child.gender
                
                if child.gender == "Male" {
                    imgViewProfile.image = UIImage(named: "boy")
                }else {
                    imgViewProfile.image = UIImage(named: "girl")
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
