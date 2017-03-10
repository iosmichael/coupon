//
//  ConfigManager.swift
//  CouponApp
//
//  Created by Michael Liu on 3/9/17.
//  Copyright © 2017 Coupon. All rights reserved.
//

import UIKit
import Firebase

class ConfigManager: NSObject {
    var configRef:FIRDatabaseReference = FIRDatabase.database().reference()
    func getCategories(handler: @escaping (([String])->Void)){
        let categoriesRef = configRef.child("categories")
        categoriesRef.observe(.value, with: { (snapshot) in
            var categories:[String] = []
            for child: FIRDataSnapshot in snapshot.children.allObjects as! [FIRDataSnapshot]{
                categories.append(child.value as! String)
            }
            handler(categories)
        })
    }
}