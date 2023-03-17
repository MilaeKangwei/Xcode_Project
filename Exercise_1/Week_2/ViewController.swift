//
//  ViewController.swift
//  Week_2
//
//  Created by labuser on 25/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberbutton: UISlider!
    @IBOutlet weak var KM_Number: UITextField!
    @IBOutlet weak var Miles_Number: UITextField!
    @IBOutlet weak var laber: UILabel!
    @IBOutlet weak var laberMiles: UILabel!
    @IBOutlet weak var laberKM: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func `switch`(_ sender: Any) {
        if laber.text == "KM to Miles"{
            laber.text = "Miles to KM"
            laberKM.text = "Miles"
            laberMiles.text = "KM"
        }
        else{
            laber.text = "KM to Miles"
            laberKM.text = "KM"
            laberMiles.text = "Miles"
        }
    }
   
    @IBAction func converter(_ sender: Any) {
        if laber.text == "KM to Miles"{
            let number = Float(KM_Number.text!.description)!
            Miles_Number.text = (number * 0.6).description
        }
        else{
            let number1 = Float(KM_Number.text!.description)!
            Miles_Number.text = (number1 / 0.6).description
        }
    }
   
    @IBAction func numbershow(_ sender: Any) {
        KM_Number.text = numberbutton.value.description
    }
}

