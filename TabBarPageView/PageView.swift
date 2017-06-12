//
//  PageView.swift
//  TabBarPageView
//
//  Created by chc on 2017/6/9.
//  Copyright © 2017年 chc. All rights reserved.
//

import UIKit

public class PageView: UIView, UIScrollViewDelegate {
    var tabBar: TabBarView!
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        view.isPagingEnabled = true
        view.delegate = self
        return view
    }()
    var tabItems: [(String, UIView)]!
    var currentPageNumber = 0

    public init(frame: CGRect, tabItems: [(String, UIView)]) {
        super.init(frame: frame)
        self.tabItems = tabItems
        var tabBarItems: [(String, ((Int) -> Void))] = []
        for item in tabItems {
            scrollView.addSubview(item.1)
            let tabBarItem = (item.0, { [weak self] (index: Int) -> Void in
                guard let frame = self?.scrollView.frame else { return }
                self?.currentPageNumber = index
                self?.scrollView.scrollRectToVisible(frame.offsetBy(dx: CGFloat(index) * frame.size.width, dy: 0), animated: false)
            })
            tabBarItems.append(tabBarItem)
        }
        tabBar = TabBarView(items: tabBarItems)
        
        addSubview(tabBar)
        addSubview(scrollView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let tabBarHeight: CGFloat = 55
        var frame = tabBar.frame
        frame.size.width = bounds.size.width
        frame.size.height = tabBarHeight
        tabBar.frame = frame
        scrollView.frame = bounds.offsetBy(dx: 0, dy: tabBarHeight)
        scrollView.contentSize = CGSize(width: CGFloat(tabItems.count) * bounds.size.width, height: scrollView.frame.size.height)
        
        let views = scrollView.subviews
        for i in 0..<views.count {
            let frame = scrollView.bounds.offsetBy(dx: CGFloat(i) * scrollView.bounds.size.width, dy: 0)
            views[i].frame = frame
        }
    }
    
    // MARK: UIScrollViewDelegate
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let pageNumber = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        if pageNumber != currentPageNumber {
            currentPageNumber = pageNumber
            tabBar.setCurrentTabIndex(newIndex: pageNumber)
        }
    }

}
