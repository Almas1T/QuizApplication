//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-26.
//

import UIKit

class ScoreViewController: UIViewController {

    var getScore = 0
    var totalScore = 0
    var per = 0.0
    var hist = [History]()
    var history = [History]()
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var histTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        histTable.delegate = self
        histTable.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated: false)
        score.text = "\(getScore) out of \(totalScore)"
        percentage.text = "You got \(per)% of answers correct"
        history = hist
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let home = segue.destination as? HomeViewController{
            home.history = history
        }
        
    }
}

extension ScoreViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let log = history[indexPath.row]
        let cell = histTable.dequeueReusableCell(withIdentifier: "hCell") as! HistoryCell
        cell.setHCell(h: log)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Quiz Name" + String(repeating: " ", count: 40) + "Score"
    }
}
