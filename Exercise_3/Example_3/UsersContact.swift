//
//  UsersContact.swift
//  Example_3
//
//  Created by labuser on 30/12/2022.
//

import UIKit

class UsersContact: NSObject {
    var name : String
    var phone : String
    var comment : String
    var cardNo : Int
    var date : Int
    var cvv : Int

   
    
    init(name: String, phone: String, comment: String, cardNo: Int, date: Int, cvv: Int) {
        self.name = name
        self.phone = phone
        self.comment = comment
        self.cardNo = cardNo
        self.date = date
        self.cvv = cvv
    
     
    }


}
