//
//  GroupModel.swift
//  BoomsetApp
//
//  Created by Onur Sanver on 7.08.2019.
//  Copyright © 2019 Onur Sanver. All rights reserved.
//

import Foundation

struct GroupModel : Codable {
    let id : Int
    var name :String?
    var email : String?
    var phone : String?
    var website: String?
    var type :  String?
    var parent_id : String?
}
