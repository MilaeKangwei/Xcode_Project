//
//  AccountViewController.swift
//  Exercis_6
//
//  Created by labuser on 11/02/2023.
//

import UIKit
import CoreData

class AccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var confiompasswordTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UILabel!

    var array :[Login] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext

        let request: NSFetchRequest<Login> = Login.fetchRequest()
        let defaults = UserDefaults.standard
        let loggedInUsername = defaults.string(forKey: "loggedInUsername")
        request.predicate = NSPredicate(format: "username = %@", loggedInUsername!)
        usernameTxt.text = loggedInUsername

    }
    
    @IBAction func Update(_ sender: Any) {
        guard let loggedInUsername = UserDefaults.standard.string(forKey: "loggedInUsername") else {
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Login")
        request.predicate = NSPredicate(format: "username = %@", loggedInUsername)

        do {
            let result = try manageContext.fetch(request)
            if result.count > 0 {
                if let user = result.first as? NSManagedObject,
                   let password = passwordTxt.text,
                   let confirmPassword = confiompasswordTxt.text,
                   !password.isEmpty,
                   !confirmPassword.isEmpty,
                   password == confirmPassword {
                    
                    user.setValue(confirmPassword, forKey: "password")
                    try manageContext.save()

                    let alert = UIAlertController(title: "Success", message: "Password updated successfully", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                    
                } else {
                    let alert = UIAlertController(title: "Error", message: "Please make sure both password fields are filled and match.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    present(alert, animated: true)
                }
            } else {
                let alert = UIAlertController(title: "Error", message: "Password update failed. No matching user found.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
            }
        } catch let error as NSError {
            print(error)
        }
    }

    
    @IBAction func LoginOut(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func SelectPhoto(_ sender: Any){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true)
        
        if let image = info[.originalImage] as? UIImage{
            imageView.image = image
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true)
    }
}
