//
//  ViewController.swift
//  Exercis_6
//
//  Created by labuser on 07/02/2023.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func Loginbutton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Login")
        request.predicate = NSPredicate(format: "username = %@", usernameTxt.text!.description)
        do{
            let result = try manageContext.fetch(request)
            if(result.count > 0){
                let user = result[0] as! Login
                if(user.password==passwordTxt.text!.description){
                    let defaults = UserDefaults.standard
                    defaults.set(user.username, forKey: "loggedInUsername")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let item = storyboard.instantiateViewController(withIdentifier: "item") as! UITabBarController
                    present(item, animated: true)
                }
                else{
                    let alert = UIAlertController(title: "Login Fail", message: "Incorrect password!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                }
            }
            else{
                let alert = UIAlertController(title: "Login Fail", message: "No account found!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
        }
        catch let error as NSError{
            print(error)
        }
    }
    
    
}

