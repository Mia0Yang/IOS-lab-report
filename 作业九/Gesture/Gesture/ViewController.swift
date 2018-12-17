//
//  ViewController.swift
//  Gesture
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 YangMiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addLabel(_ sender: Any) {
        let x = Int(arc4random()) % Int(view.bounds.width)
        let y = Int(arc4random()) % Int(view.bounds.height)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text = "💜"
        label.textAlignment = .center
        label.backgroundColor = UIColor.orange
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 5
            , height: 5)
        label.layer.shadowOpacity = 1
        
        view.addSubview(label)
        
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer: )))
        label.addGestureRecognizer(panRecognizer)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer: )))
        label.addGestureRecognizer(pinchRecognizer)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer: )))
        label.addGestureRecognizer(tapRecognizer)
        label.isUserInteractionEnabled = true
        
    }
    
    //拖动
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
        
    }
    //缩放
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            recognizer.view?.bounds.size = CGSize(width: view.bounds.width * recognizer.scale
                , height: view.bounds.height * recognizer.scale)
        default:
            break
        }
        
    }
    
    //双击删除
    @objc func tap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .recognized:
            recognizer.view?.removeFromSuperview()
        default:
            break
        }
        
    }
    
        @IBAction func moveLabel(_ sender: Any) {
            for label in view.subviews {
                if label is UILabel {
                    UIView.animate(withDuration: 1) {
                        let x = Int(arc4random()) % Int(self.view.bounds.width)
                        let y = Int(arc4random()) % Int(self.view.bounds.height)
                        label.center.x = CGFloat(x)
                        label.center.y = CGFloat(y)
                    }
                }
            }
    }
    @IBAction func deleteLabel(_ sender: Any) {
        for label in view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
    
    
}

