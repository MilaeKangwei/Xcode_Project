//
//  RegisterViewController.swift
//  Exercis_6
//
//  Created by labuser on 07/02/2023.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var gmaiilTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confiompasswordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if (passwordTxt.text!.description != "" || confiompasswordTxt.text!.description != "" || gmaiilTxt.text!.description != "" || usernameTxt.text!.description != ""){
            if (passwordTxt.text!.description == confiompasswordTxt.text!.description){
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let manageContext = appDelegate.persistentContainer.viewContext
                let entity = NSEntityDescription.entity(forEntityName: "Login", in: manageContext)
                let login = NSManagedObject(entity: entity!, insertInto: manageContext) as! Login
                
                login.username = usernameTxt.text!.description
                login.gmail = gmaiilTxt.text!.description
                login.password = passwordTxt.text!.description
                
                do{
                    try manageContext.save()
                    let alert = UIAlertController(title: "Success", message: "Sign Up Success", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                }
                catch let error as NSError{
                    print(error)
                }
            }
            else{
                let alert = UIAlertController(title: "Fail", message: "Password is no same as Confirm Password", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
           
        }
        else{
            let alert = UIAlertController(title: "Fail", message: "SignUp is Fail", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
    }
}
