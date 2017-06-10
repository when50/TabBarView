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
    var tabBar: TabBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let titles: [String] = Array(0..<8).map{ "Tab \($0)" }
        tabBar = TabBarView(titles: titles)
        view.addSubview(tabBar)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var frame = tabBar.frame
        frame.size = CGSize(width: view.bounds.size.width, height: 55)
        tabBar.frame = frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

