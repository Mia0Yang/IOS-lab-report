//
//  ViewController.swift
//  transition
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func btnClicked(_ sender: Any) {
        UIView.transition(with: myView, duration: 2, options: .transitionCurlUp, animations:{
            if self.myView.backgroundColor == UIColor.purple {
                self.myView.backgroundColor = UIColor.orange
            }else{
                self.myView.backgroundColor = UIColor.purple}}, completion: nil)
    }
    
    @IBAction func viewImage(_ sender: Any) {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        imageView.image = UIImage(named: "image")
        UIView.transition(from: myView, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
        
    }
}

