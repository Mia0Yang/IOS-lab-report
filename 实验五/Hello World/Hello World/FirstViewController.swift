//
//  FirstViewController.swift
//  Hello World
//
//  Created by yangmiao on 2018/10/17.
//  Copyright © 2018年 yangmiao All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.3982995152, green: 0.4406005144, blue: 0.3491283953, alpha: 1)
        let lable = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        lable.text = "Hello World"
        lable.textAlignment = .center
        lable.backgroundColor = #colorLiteral(red: 0.963211596, green: 0.9029007554, blue: 0.07500026375, alpha: 1)
        lable.center = self.view.center
        self.view.addSubview(lable)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Click Me", for: .normal)
        button.setTitle("I am so happy ", for: .highlighted)
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(btuClicked), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    @objc func btuClicked(){
//        if let lable = view.subviews.first as? UILabel{
//            lable.text = "I am clicked"
//        }
//        print("I am clicked")
        present(SecondViewController(),animated: true,completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
