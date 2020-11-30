//
//  CreateViewController.swift
//  QuizApp
//
//  Created by Almas Tai on 2020-11-26.
//

import UIKit
import RealmSwift

class CreateViewController: UIViewController {
    

    private let realm = try! Realm()
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIButton) {
        if !name.text!.isEmpty && !userName.text!.isEmpty && !contact.text!.isEmpty && !password.text!.isEmpty{
            
            
            
            self.realm.beginWrite()
            let user = User()
            user.name = name.text
            user.username = userName.text
            user.contact = Int(String(contact.text!))!
            user.password = password.text
            self.realm.add(user)
            try! self.realm.commitWrite()
            
            let x = Array(realm.objects(User.self))
            print(x)
            performSegue(withIdentifier: "signup", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    

}


