//
//  PatmentViewController.swift
//  Exercis_6
//
//  Created by labuser on 19/02/2023.
//

import UIKit
import CoreData
class PatmentViewController: UIViewController {
    
    var total : Double?
    @IBOutlet weak var totalTxt: UILabel!
    @IBOutlet weak var dayTxt: UITextField!
    @IBOutlet weak var cvvTxt: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var cardName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTxt.text! = total!.description
    }
    
    @IBAction func payButton(_ sender: Any) {
        if(cardName.text != "" || cardNumber.text != "" || cvvTxt.text != "" || dayTxt.text != ""){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let manageContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Login", in: manageContext)
            _ = NSManagedObject(entity: entity!, insertInto: manageContext) as! Login
            let defaults = UserDefaults.standard
            _ = defaults.string(forKey: "loggedInUsername")
            
            do{
               try manageContext.save()
                NotificationCenter.default.post(name: NSNotification.Name("refreshTable"), object: nil)
                    self.dismiss(animated: true)
                    }
                catch let error as NSError{
                        print(error)
                }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Fill", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
    
            
    
        
    }
    
}
