//
//  ViewController.swift
//  ScrollView
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 YangMiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {


    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in  1...7 {
        let imageView = UIImageView(image: UIImage(named: "image\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1)*scrollView.bounds.width
                , y: 0
                , width: scrollView.bounds.width
                , height: scrollView.bounds.height)
        scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
            
        }
        scrollView.contentSize = CGSize(width: 4*scrollView.bounds.width
            , height: 4*scrollView.bounds.height)
//        scrollView.minimumZoomScale = 0.2
//        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        
    }
    
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return scrollView.subviews.first
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible( rect, animated: true)
    }
    
}

