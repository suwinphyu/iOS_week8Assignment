//
//  MainTableViewViewController.swift
//  NestedTableView
//
//  Created by Su Win Phyu on 9/15/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit
import Alamofire

class MainTableViewViewController: UIViewController {

    @IBOutlet weak var contactsTableView: UITableView!
    var parentList : [ParentVO] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getParentList()
       
    }
    
    func getParentList(){
        ParentModel.shared().apiGetParents(success: {
            self.parentList = ParentModel.shared().parents
            //print(ParentModel.shared().parents)
            self.contactsTableView.reloadData()
            
        }) { (err) in
            print(err)
        }
    }

    func setupTableView(){
        //setup table view
        contactsTableView.separatorStyle = .none
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.register(UINib(nibName: ParentListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ParentListItemTableViewCell.identifier)
    }

}

extension MainTableViewViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let childItemCount = self.parentList[indexPath.row].childs?.count ?? 0
        return CGFloat(53 + (120 * childItemCount)) // 16 + 16 + 21  label top + label height + tableview top , 108 = child table view height
    }
    
}

extension MainTableViewViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ParentListItemTableViewCell.self), for: indexPath) as! ParentListItemTableViewCell
       
      //data pasing
        cell.parent = parentList[indexPath.row]
       // print(parentList[indexPath.row])
        //cell.parent = ParentModel.shared().parents[indexPath.row]
        return cell
    }
}

