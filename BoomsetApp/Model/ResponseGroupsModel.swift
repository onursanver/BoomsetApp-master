//
//  ResponseGroupsModel.swift
//  BoomsetApp
//
//  Created by Onur Sanver on 8.08.2019.
//  Copyright © 2019 Onur Sanver. All rights reserved.
//

import Foundation

struct ResponseGroupsModel : Codable {
    
    var count : Int?
    var previous : Int?
    var results : [GroupModel]
    var next :Int?

}
