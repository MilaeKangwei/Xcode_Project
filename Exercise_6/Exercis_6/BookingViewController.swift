//
//  BookingViewController.swift
//  Exercis_6
//
//  Created by labuser on 11/02/2023.
//

import UIKit
import CoreData

class BookingViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    var array :[Login] = []
        
    @IBOutlet weak var tview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           NotificationCenter.default.addObserver(self, selector: #selector(refreshTable(sumbitNotification:)), name: NSNotification.Name("refreshTable"), object: nil)

           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let manageContext = appDelegate.persistentContainer.viewContext
           let request : NSFetchRequest<NSFetchRequestResult> =
                   NSFetchRequest(entityName: "Login")
           let defaults = UserDefaults.standard
           let loggedInUsername = defaults.string(forKey: "loggedInUsername")
           request.predicate = NSPredicate(format: "username = %@", loggedInUsername!)
           do{
               let result = try manageContext.fetch(request)
               array = result as! [Login]
           }
           catch let error as NSError{
               print(error)
           }
           tview.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return array.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell!.textLabel?.text = array[indexPath.row].hotelname
        cell?.detailTextLabel?.text = array[indexPath.row].checkin?.description
            
        return cell!
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "detailSegue"){
                let destination = segue.destination as! BookingEditViewController
                let data = array[tview.indexPathForSelectedRow!.row]
                destination.data = data
            }
        }
    @objc func refreshTable(sumbitNotification: Notification){
        viewDidLoad()
        self.tview.reloadData()
    }
}
