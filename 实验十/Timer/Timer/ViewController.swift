//
//  ViewController.swift
//  Timer
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTimer: UIView!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak weakSelf=self](myTimer) in
            weakSelf?.myTimer.center.x += 20
        })
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        timer?.invalidate()
        UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseInOut, .autoreverse], animations: {
            self.myTimer.alpha = 0
            self.myTimer.center.x = self.view.bounds.width
            self.myTimer.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.4, y: 0.4)
            self.myTimer.transform = CGAffineTransform.identity
            self.myTimer.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.4, y: 0.4)
            self.myTimer.transform = CGAffineTransform.identity
            self.myTimer.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.4, y: 0.4)
            self.myTimer.transform = CGAffineTransform.identity
        }) {(finished) in
            if finished {
                self.myTimer.removeFromSuperview()
            }
        }
    }
    
    
    

}

