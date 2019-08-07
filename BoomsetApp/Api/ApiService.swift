//
//  ApiService.swift
//  BoomsetApp
//
//  Created by Onur Sanver on 7.08.2019.
//  Copyright © 2019 Onur Sanver. All rights reserved.
//

import Foundation
import Alamofire

class ApiService: NSObject {
    
    var authModel : AuthModel?
    
    static let shared : ApiService = ApiService()

    func loginWithParams(params :[String :Any] , completionHandler:@escaping(AuthModel?)->()) {
        
        Alamofire.request("https://www.boomset.com/apps/api/auth", method: .post,  parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            guard  response.result.isSuccess , let responseData = response.data else {
                print("Error Apiiii")
                completionHandler(nil)
                return }
            
            print(response)
            do {
                let authModel = try JSONDecoder().decode(AuthModel.self, from: responseData)
                self.authModel = authModel
               completionHandler(authModel)
                
            } catch let error {
                print(error)
                completionHandler(nil)
            }
        }
    }
    
    func getGroupModels(completionHandler:@escaping([GroupModel]?)->()) {
        
        guard let authModel = self.authModel else { return }
        let headers = ["Authorization": "Token " + authModel.token, "Content-Type": "application/json"]
        
        Alamofire.request("https://api.boomset.com/groups", method: .get,  parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            print(response)
           
            guard  response.result.isSuccess , let responseData = response.data else {
                print("Error Apiiii")
                completionHandler(nil)
                return }
            
            print(response)
            do {
                let responseGroupModel = try JSONDecoder().decode(ResponseGroupsModel.self, from: responseData)
                completionHandler(responseGroupModel.results)
                
            } catch let error {
                print(error)
                completionHandler(nil)
            }
        }
    }
}


