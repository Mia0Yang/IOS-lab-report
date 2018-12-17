//
//  CircleView.swift
//  Gesture
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 YangMiao. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    @IBInspectable var fillColor: UIColor?
    @IBInspectable var stokeColor: UIColor?
    
    func setup(){
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer: )))
        self.addGestureRecognizer(panRecognizer)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer: )))
        self.addGestureRecognizer(pinchRecognizer)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer: )))
        self.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.numberOfTapsRequired = 2
    }
    //拖动
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
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
            bounds.size = CGSize(width: bounds.width * recognizer.scale
                , height: bounds.height * recognizer.scale)
        default:
            break
        }
        
    }
    
    //双击
    @objc func tap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .recognized:
           print("double clicked")
        default:
            break
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor?.setFill()
        stokeColor?.setFill()
        path.fill()
        path.stroke()
    }
}
