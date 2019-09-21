//
//  ParentListItemTableViewCell.swift
//  NestedTableView
//
//  Created by Su Win Phyu on 9/15/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class ParentListItemTableViewCell: UITableViewCell {

    static let identifier = "ParentListItemTableViewCell"
    
    @IBOutlet weak var tableViewChildList: UITableView!
    @IBOutlet weak var lblParentName: UILabel!
    
    var parent : ParentVO? {
        didSet{
            if let parent = parent {
                lblParentName.text = parent.parentName
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        tableViewChildList.isScrollEnabled = false
        tableViewChildList.separatorStyle = .none
        tableViewChildList.dataSource = self
        tableViewChildList.delegate = self
        tableViewChildList.register(UINib(nibName: ChildListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ChildListItemTableViewCell.identifier)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ParentListItemTableViewCell : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parent?.childs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildListItemTableViewCell.identifier, for: indexPath) as! ChildListItemTableViewCell
        cell.child = parent?.childs?[indexPath.row]
        return cell
    }
}

extension ParentListItemTableViewCell : UITableViewDelegate{}
