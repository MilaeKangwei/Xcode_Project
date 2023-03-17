//
//  BookingEditViewController.swift
//  Exercis_6
//
//  Created by labuser on 14/02/2023.
//

import UIKit
import CoreData
class BookingEditViewController: UIViewController {

    
    @IBOutlet weak var peoplenumTxt: UITextField!
    @IBOutlet weak var ToTxt: UILabel!
    @IBOutlet weak var Form: UILabel!
    @IBOutlet weak var nameTxt: UILabel!
    var data : Login?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxt.text = data!.hotelname!.description
        ToTxt.text = data!.checkout!.description
        Form.text = data!.checkin!.description
        peoplenumTxt.text = data!.numpeople.description
        
    }
    
    @IBAction func upadeButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let manageContext = appDelegate.persistentContainer.viewContext
                let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Login")
                request.predicate = NSPredicate(format: "hotelname = %@", nameTxt.text!.description)
                
                do{
                    let result = try manageContext.fetch(request)
                    if (result.count > 0){
                        let object = result[0] as! NSManagedObject
                        object.setValue(Int32(peoplenumTxt.text!), forKey: "numpeople")
                        try manageContext.save()
                        
                        NotificationCenter.default.post(name: NSNotification.Name("refreshTable"), object: nil)
                        self.dismiss(animated: true)
                        
                  
                        
                    }
                }
                catch let error as NSError{
                    print(error)
                }
                self.dismiss(animated: true)
    }
    
    @IBAction func delButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Login")
        request.predicate = NSPredicate(format: "hotelname = %@", nameTxt.text!.description)
                
                do{
                    let result = try manageContext.fetch(request)
                    
                    if(result.count > 0){
                        
                        let object = result[0] as! NSManagedObject
                        manageContext.delete(object)
                       
                        try manageContext.save()
                        
                        NotificationCenter.default.post(name: NSNotification.Name("refreshTable"), object: nil)
                    }
                    self.dismiss(animated: true)
                }
                
                catch let error as NSError{
                    print(error)
                }
    }
    

}
