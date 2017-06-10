//
//  BaseStyle.swift
//  TabBarPageView
//
//  Created by chc on 2017/6/9.
//  Copyright © 2017年 chc. All rights reserved.
//

import Foundation

public protocol BaseStyle {
    func applyTo(_ cell: TabCollectionCell)
}
