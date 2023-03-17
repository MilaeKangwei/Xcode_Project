//
//  PaymentViewController.swift
//  Example_3
//
//  Created by labuser on 30/12/2022.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var cardTxt: UITextField!
    
    @IBOutlet weak var ccvText: UITextField!
    
    @IBOutlet weak var dateTxt: UITextField!
    
    @IBOutlet weak var totalTxt: UILabel!
    
    var price : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTxt.text = price
    }
    
    @IBAction func comfirm(_ sender: Any) {
        let name : String = nameTxt.text!.description
        let card : String = cardTxt.text!.description
        let cvv : String = ccvText.text!.description
        let date : String = dateTxt.text!.description

        
        let u1 = (name : name, card :card, cvv:cvv, date:date)
        
        if(u1.name == "" || u1.card == "" || u1.cvv == "" || u1.date == ""){
            let action = UIAlertController(title: "Pls full All!!", message: "Submit Unsuccess", preferredStyle:.actionSheet)
            let action1 = UIAlertAction(title: "UnSuccess", style: .default)
            action.addAction(action1)
            present(action, animated: true)
        }
        else{
            let action = UIAlertController(title: "Success!!", message: "Submit Success", preferredStyle:.actionSheet)
            let action1 = UIAlertAction(title: "Success", style: .default)
            action.addAction(action1)
            present(action, animated: true)
        }
        }
    

    
}
