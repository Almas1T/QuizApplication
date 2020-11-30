//
//  QuizData.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-27.
//

import Foundation
import RealmSwift

class QuizData: Object {
    @objc dynamic var quizTitle : String?
    @objc dynamic var question : String?
    var options = List<String>()
    @objc dynamic var answer : String?
}
