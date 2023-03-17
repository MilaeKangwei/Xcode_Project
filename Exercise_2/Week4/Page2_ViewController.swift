//
//  Page2_ViewController.swift
//  Week4
//
//  Created by labuser on 02/12/2022.
//

import UIKit

class Page2_ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var total : Double = 0
    
    @IBOutlet weak var total_text: UILabel!
    @IBOutlet weak var tableshow: UITableView!
    
    var name :[String] = []
    var showtotal :[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button_add_1(_ sender: Any) {
        let action = UIAlertController(title: "Message Add!!", message: "Add Success", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Add", style: .default)
        
        action.addAction(action1)
        
        present(action, animated: true)

        total += 400
        total_text.text = total.description
        
        name.append("Mouse")
        showtotal.append(400)
        tableshow.reloadData()
    }
    
    @IBAction func button_2(_ sender: Any) {
        let action = UIAlertController(title: "Message Add!!", message: "Add Success", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Add", style: .default)
        
        action.addAction(action1)
        
        present(action, animated: true)
    
        total += 200
        total_text.text = total.description
        name.append("Mic")
        showtotal.append(200)
        tableshow.reloadData()
    }
    

    @IBAction func button_3(_ sender: Any) {
        let action = UIAlertController(title: "Message Add!!", message: "Add Success", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Add", style: .default)
        
        action.addAction(action1)
        
        present(action, animated: true)
    
        total += 500
        total_text.text = total.description
        
        name.append("Mask")
        showtotal.append(500)
        tableshow.reloadData()
    }
    
    
    @IBAction func button_4(_ sender: Any) {
        let action = UIAlertController(title: "Message Add!!", message: "Add Success", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Add", style: .default)
        
        action.addAction(action1)
        
        present(action, animated: true)
    
        total += 300
        total_text.text = total.description
        
        name.append("Earphone")
        showtotal.append(300)
        tableshow.reloadData()
    }
    
    @IBAction func back_button(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "totalcall")
        
        cell?.textLabel?.text = name[indexPath.row]
        cell?.detailTextLabel?.text = "RM" + showtotal[indexPath.row].description
        return cell!
    }
    }
