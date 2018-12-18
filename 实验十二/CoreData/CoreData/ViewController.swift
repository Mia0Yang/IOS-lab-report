//
//  ViewController.swift
//  CoreData
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 yangmiao. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.name = "ym"
        person.phone = "18111032468"
        appDelegate.saveContext()
    }
    @IBAction func update(_ sender: Any) {
    }
    @IBAction func del(_ sender: Any) {
    }
    @IBAction func query(_ sender: Any) {
    }
    


}

