//
//  ParentVO.swift
//  NestedTableView
//
//  Created by Su Win Phyu on 9/15/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

struct ParentVO : Codable{
    var id : Int?
    var parentName : String?
    var childs : [ChildVO]?

}
