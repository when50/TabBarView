//
//  ViewController.swift
//  Example
//
//  Created by chc on 2017/6/9.
//  Copyright © 2017年 chc. All rights reserved.
//

import UIKit
import TabBarPageView

class ViewController: UIViewController {
    var pageView: PageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var items: [(String, UIView)] = []
        for i in 0..<8 {
            let view = UIView(frame: .zero)
            view.backgroundColor = UIColor(red: CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 255, green: CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 255, blue: CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 255, alpha: 1.0)
            let item = ("Tab \(i)", view)
            items.append(item)
        }
        pageView = PageView(frame: .zero, tabItems: items)
        view.addSubview(pageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let frame = view.bounds.offsetBy(dx: 0, dy: 20)
        pageView.frame = frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

