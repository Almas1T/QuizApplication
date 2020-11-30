//
//  History.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-28.
//

import Foundation

class History {
    var title : String
    var score : Int
    var tScore : Int
    
    init(title:String,score:Int,tScore:Int) {
        self.title = title
        self.score = score
        self.tScore = tScore
    }
}
