//
//  ItemsManager.swift
//  ToDoList
//
//  Created by Appcamp on 19/07/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import UIKit
import CoreData

var itemsMgr : ItemsManager = ItemsManager()

struct item {
    var name = ""
    var details = ""
}

class ItemsManager : NSObject {
    
    var items = [item]()
    
    func addItem (name: String, details: String){
        items.append(item(name: name, details: details))
    
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: manageContext)
        
        let itemM0 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
    
        
        itemM0.setValue(name, forKey: "name")
        itemM0.setValue(details, forKey: "details")
        
        var error: NSError?
        
        if !manageContext.save(&error) {
            println("Could not save! \(error?.userInfo)")
        }
    }
    
}