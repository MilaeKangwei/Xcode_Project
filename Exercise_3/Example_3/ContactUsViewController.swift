//
//  ContactUsViewController.swift
//  Example_3
//
//  Created by labuser on 23/12/2022.
//

import UIKit

class ContactUsViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    
    @IBOutlet weak var commentText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var array : [UsersContact] = []
    @IBAction func submit(_ sender: Any) {
        let nameT : String = nameText.text!.description
        let phoneT : String = phoneText.text!.description
        let commentT : String = commentText.text!.description
        
        
        let u1 = (name : nameT, phone: phoneT, comment: commentT)
        
        if(u1.name == " " || u1.phone == " " || u1.comment == ""){
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
