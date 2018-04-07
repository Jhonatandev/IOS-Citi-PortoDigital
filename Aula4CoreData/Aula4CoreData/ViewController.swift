//
//  ViewController.swift
//  Aula4CoreData
//
//  Created by Treinamento on 07/04/18.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var people: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let personEntity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        self.people = fetch(entityName: "Person", managedContext: managedContext)
        
        let person1 = NSManagedObject(entity: personEntity, insertInto: managedContext)
        
        person1.setValue("João", forKey: "name")
        person1.setValue("Oliveira", forKey: "surname")
        person1.setValue(NSDate.init(timeIntervalSince1970: 20.0), forKey: "birthday")
        
        let person2 = NSManagedObject(entity: personEntity, insertInto: managedContext)
        
        person2.setValue("Maria", forKey: "name")
        person2.setValue("Oliveira", forKey: "surname")
        person2.setValue(NSDate.init(timeIntervalSince1970: 20.0), forKey: "birthday")
    
        person1.setValue(person2, forKey: "spouse")
        
        let childPerson = NSManagedObject(entity: personEntity, insertInto: managedContext)
        childPerson.setValue("Fulano", forKey: "name")
        childPerson.setValue("Oliveira", forKey: "surname")
        childPerson.setValue(NSDate.init(timeIntervalSince1970: 40.0), forKey: "birthday")

        let childrenPerson1 = person1.mutableSetValue(forKey: "children")
        childrenPerson1.add(childPerson)
        
        // Do any additional setup after loading the view, typically from a nib.
        self.people = fetch(entityName: "Person", managedContext: managedContext)
        for person in self.people{
            
            if let name = person.value(forKey: "name"), let surname = person.value(forKey: "surname"){
                if let spouse = person.value(forKey: "spouse"){
                let spouseTemp = spouse as! NSManagedObject
                print("\(name) \(surname) spouse of: \(spouseTemp.value(forKey: "name") as! String)")
                if let children = person.value(forKey: "children"){
                    
                }
            }else{
                print("\(name) \(surname) spouse of none")
            }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch(entityName: String, managedContext: NSManagedObjectContext) -> [NSManagedObject]{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        do{
            let objects = try managedContext.fetch(fetchRequest)
            return objects
        }catch let error as NSError {
            print("Could not fetch. Return value is []. \(error) \(error.userInfo)")
            return []
        }
    }
    
    func save(manageContext: NSManagedObjectContext){
        do{
            try manageContext.save()
        }catch let error as NSError{
            print("Could not save. \(error) \(error.userInfo)")
        }
    }
    
    func delete(objects: [NSManagedObject], managedContext: NSManagedObjectContext){
        for object in objects{
            managedContext.delete(object)
        }
    }
    

}

