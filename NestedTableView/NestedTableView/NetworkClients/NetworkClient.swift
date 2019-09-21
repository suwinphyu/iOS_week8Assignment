//
//  NetworkClient.swift
//  NestedTableView
//
//  Created by Su Win Phyu on 9/21/19.
//  Copyright © 2019 swp. All rights reserved.
//

 import Alamofire
class NetworkClient {
    
    private static var sharedNerworkClient : NetworkClient = {
        return NetworkClient()
    }()
    
    class func shared() -> NetworkClient {
        return sharedNerworkClient
    }
    
    public func getData(route : String , success: @escaping (Any) -> Void, fauilure: @escaping (String) -> Void){
        Alamofire.request(SharedConstants.BASE_URL + route).responseData { (response) in
            switch response.result {
            case .success(let data) :
                success(data)
            case .failure(let err) :
                fauilure(err.localizedDescription)
                break
            }
        }
    }
}
