//
//  ViewController.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-26.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    private let realm = try! Realm()
    private var userList = [User]()
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        userName.text = ""
        password.text = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
        userList = Array(realm.objects(User.self))
        if !userName.text!.isEmpty && !password.text!.isEmpty{
            for i in userList{
                if i.username == userName.text! && i.password == String(password.text!){
                    print(i.username!)
                    print(i.password!)
                    print(userName.text!)
                    print(password.text!)
                    performSegue(withIdentifier: "login", sender: self)
                }
                else{
                    print("not found!")
                }
            }
        }
        else{
            print("Empty")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func logout(_ sender: UIStoryboardSegue){
        userName.text = ""
        password.text = ""
    }
    
}

