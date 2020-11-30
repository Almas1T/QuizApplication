//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-26.
//

import UIKit
import RealmSwift

class QuizViewController: UIViewController {

    private let realm = try! Realm()
    private var data = [QuizData]()
    var qTitle = ""
    var questionNo = 0
    var score = 0
    var log = History(title: "", score: 0, tScore: 0)
    var hist = [History]()
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var opt1: UIButton!
    @IBOutlet weak var opt2: UIButton!
    @IBOutlet weak var opt3: UIButton!
    @IBOutlet weak var opt4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        data = Array(realm.objects(QuizData.self).filter("quizTitle = '\(qTitle)'"))
        print(data)
        questionNo = 0
        question.text = data[questionNo].question
        opt1.setTitle(data[questionNo].options[0], for: .normal)
        opt2.setTitle(data[questionNo].options[1], for: .normal)
        opt3.setTitle(data[questionNo].options[2], for: .normal)
        opt4.setTitle(data[questionNo].options[3], for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let rightAnswer = checkAnswer(userAnswer: userAnswer)
        
        if rightAnswer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        question.text = data[questionNo].question
        opt1.setTitle(data[questionNo].options[0], for: .normal)
        opt2.setTitle(data[questionNo].options[1], for: .normal)
        opt3.setTitle(data[questionNo].options[2], for: .normal)
        opt4.setTitle(data[questionNo].options[3], for: .normal)
        
        progress.progress = Float(questionNo)/Float(data.count)
        opt1.backgroundColor = #colorLiteral(red: 0.4431372549, green: 0.4901960784, blue: 0.8901960784, alpha: 1)
        opt2.backgroundColor = #colorLiteral(red: 0.4431372549, green: 0.4901960784, blue: 0.8901960784, alpha: 1)
        opt3.backgroundColor = #colorLiteral(red: 0.4431372549, green: 0.4901960784, blue: 0.8901960784, alpha: 1)
        opt4.backgroundColor = #colorLiteral(red: 0.4431372549, green: 0.4901960784, blue: 0.8901960784, alpha: 1)
    }
    
    func checkAnswer(userAnswer:String) ->Bool{
        if userAnswer == data[questionNo].answer{
            score += 1
            return true
        }else{
            return false
        }
    }
    
    func nextQuestion(){
        if questionNo + 1 < data.count{
            questionNo += 1
        }else{
            performSegue(withIdentifier: "score", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        log.title = self.title!
        log.score = score
        log.tScore = data.count
        hist.append(log)
        let sc = segue.destination as! ScoreViewController
        sc.getScore = score
        sc.totalScore = data.count
        sc.per = (Double(score)/Double(data.count)) * 100
        sc.hist = hist
    }
}
