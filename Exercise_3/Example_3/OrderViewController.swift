//
//  OrderViewController.swift
//  Example_3
//
//  Created by labuser on 23/12/2022.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var totalText: UILabel!

    var total : Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Add1(_ sender: Any) {
        total += 40
        totalText.text = total.description
    }
    
    @IBAction func Add2(_ sender: Any) {
        total += 140
        totalText.text = total.description
    }
    
    @IBAction func Add3(_ sender: Any) {
        total += 100
        totalText.text = total.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "payShow"){
            let destination = segue.destination as!
            PaymentViewController
            let person = total.description
            destination.price = person
        }
    }
        
}
