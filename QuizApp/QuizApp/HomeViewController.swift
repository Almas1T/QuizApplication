//
//  HomeViewController.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-26.
//

import UIKit
import RealmSwift
class HomeViewController: UIViewController {

    private let realm = try! Realm()
    private var quizList = [QuizInfo]()
    var userN = ""
    var qTitle = ""
    var history = [History]()
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var quizTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        quizList = Array(realm.objects(QuizInfo.self))
        print(quizList)
        quizTable.delegate = self
        quizTable.dataSource = self
        quizTable.rowHeight = 100
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue){}
}

extension HomeViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quizObj = quizList[indexPath.row]
        let cell = quizTable.dequeueReusableCell(withIdentifier: "qCell") as? QuizCell
        cell?.title = quizObj.title!
        cell?.img = quizObj.img!
        cell?.qCellSetup()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        quizTable.deselectRow(at: indexPath, animated: true)
        qTitle = quizList[indexPath.row].title!
        performSegue(withIdentifier: "toQuiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let qc = segue.destination as? QuizViewController{
            qc.qTitle = qTitle
            qc.title = qTitle
            qc.hist = history
        }
        
    }
    
}
