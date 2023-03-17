//
//  item2ViewController.swift
//  Exercis_6
//
//  Created by labuser on 17/02/2023.
//

import UIKit
import CoreData

class item2ViewController: UIViewController {

    @IBOutlet weak var totalTxt: UILabel!
    @IBOutlet weak var CheckOut: UIDatePicker!
    @IBOutlet weak var CheckIN: UIDatePicker!
    @IBOutlet weak var numbepeople: UITextField!
    @IBOutlet weak var name: UILabel!
    
    var total : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pay(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Login", in: manageContext)
        let login = NSManagedObject(entity: entity!, insertInto: manageContext) as! Login
        let defaults = UserDefaults.standard
        let loggedInUsername = defaults.string(forKey: "loggedInUsername")
            
        login.username = loggedInUsername
        login.hotelname = name.text!.description
        login.numpeople = Int16(numbepeople.text!.description)!
        login.checkin = CheckIN.date
        login.checkout = CheckOut.date
        login.total = totalTxt.description
        
        performSegue(withIdentifier: "showPayment", sender: total)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "showPayment"){
                if let destination = segue.destination as? PatmentViewController{
                    if let data = sender as? Double{
                        destination.total = data
                    }
                }
            }
        }
    
    @IBAction func datePick(_ sender: Any) {
        let datein = CheckIN.date
        let dateout = CheckOut.date
        let timrDifference = dateout.timeIntervalSince(datein)
        let numberofdays = Int(timrDifference / (60 * 60 * 24) * 300)
        totalTxt.text = numberofdays.description
        total = numberofdays
    }

    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
