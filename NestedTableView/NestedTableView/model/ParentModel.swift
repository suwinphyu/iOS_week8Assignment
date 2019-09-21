//
//  ParentModel.swift
//  NestedTableView
//
//  Created by saw pyaehtun on 21/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import Alamofire

class ParentModel {
    var parents : [ParentVO] = []
    
    class func shared() -> ParentModel {
        return sharedParentModel
    }
    
    private static var sharedParentModel : ParentModel = {
        return ParentModel()
    }()
    
    func apiGetParents(success : @escaping () -> Void, faulire: @escaping (String) -> Void) {
        
        NetworkClient.shared().getData(route: SharedConstants.ApiRoute.GET_PARENTS, success: {(data) in
            
            guard let data = data as? Data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let parentsFromData = try
                    decoder.decode([ParentVO].self, from: data)
                self.parents = parentsFromData
                success()
                
            } catch let jsonError{
                print(jsonError)
            }
        }) { (err) in
            faulire(err)
        }
    }
    
}

