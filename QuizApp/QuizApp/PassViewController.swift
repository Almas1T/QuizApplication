//
//  PassViewController.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-26.
//

import UIKit
import RealmSwift

class PassViewController: UIViewController {

    private let realm = try! Realm()
    private var userList = [User]()
    
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var passLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = Array(realm.objects(User.self))
        print(list)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func getPass(_ sender: UIButton) {
        userList = Array(realm.objects(User.self))
        if !name.text!.isEmpty && !contact.text!.isEmpty{
            for i in userList{
                if i.name == name.text! && i.contact == Int(String(contact.text!))!{
                    passLabel.text = "Your password is " + String(i.password!)
                }
                //passLabel.text = "User not Found!"
            }
            
        }
    }
    
    
}
