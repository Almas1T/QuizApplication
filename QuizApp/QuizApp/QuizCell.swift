//
//  QuizCell.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-27.
//

import UIKit

class QuizCell: UITableViewCell {

    var title = ""
    var img = ""
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizTitle: UILabel!
    
    func qCellSetup(){
        quizTitle.text = title
        quizImage.image = UIImage(named: img)
    }

}
