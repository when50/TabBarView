//
//  SelectedStyle.swift
//  TabBarPageView
//
//  Created by chc on 2017/6/9.
//  Copyright © 2017年 chc. All rights reserved.
//

import UIKit

public class SelectedStyle: BaseStyle {
    var color: UIColor
    
    init(textColor: UIColor) {
        self.color = textColor
    }
    
    public func applyTo(_ cell: TabCollectionCell) {
        cell.titleLabel.textColor = color
        cell.currentBarView.isHidden = false
    }
}
