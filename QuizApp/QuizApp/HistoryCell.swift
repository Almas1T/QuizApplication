//
//  HistoryCell.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-28.
//

import UIKit

class HistoryCell: UITableViewCell {

    
    @IBOutlet weak var qTitle: UILabel!
    @IBOutlet weak var qScore: UILabel!
    
    func setHCell(h:History){
        qTitle.text = h.title
        qScore.text = String("\(h.score)/\(h.tScore)")
    }
}
