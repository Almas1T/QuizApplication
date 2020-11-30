//
//  User.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-26.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name : String?
    @objc dynamic var username : String?
    @objc dynamic var contact : Int = 0
    @objc dynamic var password : String?
}
