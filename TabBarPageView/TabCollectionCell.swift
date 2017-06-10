//
//  TabCollectionCell.swift
//  TabBarPageView
//
//  Created by chc on 2017/6/9.
//  Copyright © 2017年 chc. All rights reserved.
//

import UIKit

public class TabCollectionCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currentBarView: UIView!
    
    var titleText: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
            titleLabel.invalidateIntrinsicContentSize()
            invalidateIntrinsicContentSize()
        }
    }
    
    var inset: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 15)

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        if let count = titleLabel.text?.characters.count, count > 0 {
            return intrinsicContentSize
        } else {
            return .zero
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        let width = titleLabel.intrinsicContentSize.width + (inset.left + inset.right)
        let height = titleLabel.intrinsicContentSize.height + (inset.top + inset.bottom)
        return CGSize(width: width, height: height)
    }

}
