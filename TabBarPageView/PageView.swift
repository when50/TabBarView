//
//  PageView.swift
//  TabBarPageView
//
//  Created by chc on 2017/6/9.
//  Copyright © 2017年 chc. All rights reserved.
//

import UIKit

public class PageView: UIView {
    var tabBar: TabBarView

    public init(frame: CGRect, tabTitles: [String]) {
        let tabItems: [(String, ((Int) -> Void))] = Array(0..<8).map{ ("Tab \($0)", {(index) -> Void in
            print("selected \(index)")
        }) }
        tabBar = TabBarView(items: tabItems)
        
        super.init(frame: frame)
        addSubview(tabBar)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        var frame = tabBar.frame
        frame.size.width = bounds.size.width
        frame.size.height = 55
    }

}
