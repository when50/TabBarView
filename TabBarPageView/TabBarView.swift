//
//  TabBarView.swift
//  TabBarPageView
//
//  Created by chc on 2017/6/9.
//  Copyright © 2017年 chc. All rights reserved.
//

import UIKit

public class TabBarView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var tabItems: [(String, ((Int) -> Void))] = []
    var selectedIndex = 0
    var collectionView: UICollectionView
    
    private var cellForSize: TabCollectionCell
    public var selectedStyle: BaseStyle = {
        return SelectedStyle(textColor: UIColor.gray)
    }()
    public var unselectedStyle: BaseStyle = {
        return UnselectedStyle(textColor: UIColor.black)
    }()
    
    public init(items: [(String, ((Int) -> Void))]){
        let bundle = Bundle(for: TabBarView.self)
        let nib = UINib(nibName: "\(TabCollectionCell.self)", bundle: bundle)
        
        cellForSize = nib.instantiate(withOwner: nil, options: nil).first as! TabCollectionCell
        
        tabItems = items
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(frame: .zero)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollsToTop = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(nib, forCellWithReuseIdentifier: "\(TabCollectionCell.self)")
        addSubview(collectionView)
        
        let top = NSLayoutConstraint(item: self,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: collectionView,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 0)
        let bottom = NSLayoutConstraint(item: self,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: collectionView,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: 0)
        let left = NSLayoutConstraint(item: self,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: collectionView,
                                      attribute: .left,
                                      multiplier: 1.0,
                                      constant: 0)
        let right = NSLayoutConstraint(item: self,
                                       attribute: .right,
                                       relatedBy: .equal,
                                       toItem: collectionView,
                                       attribute: .right,
                                       multiplier: 1.0,
                                       constant: 0)
        addConstraints([top, bottom, left, right])
    }

    convenience override init(frame: CGRect) {
        self.init(items: [])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: UICollectionViewDataSource
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItems.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TabCollectionCell.self)", for: indexPath) as? TabCollectionCell else { fatalError() }
        cell.titleLabel.text = tabItems[indexPath.item].0
        let style = selectedIndex == indexPath.item ? selectedStyle : unselectedStyle
        style.applyTo(cell)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item != selectedIndex {
            let selected = IndexPath(item: selectedIndex, section: 0)
            selectedIndex = indexPath.item
            collectionView.reloadItems(at: [selected, indexPath])
            tabItems[indexPath.item].1(selectedIndex)
        }
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    var cacheSizes: [IndexPath: CGSize] = [:]
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let size = cacheSizes[indexPath] {
            return size
        } else {
            cellForSize.titleText = tabItems[indexPath.item].0
            cellForSize.sizeToFit()
            
            let size = cellForSize.bounds.size
            cacheSizes[indexPath] = size
            return size
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
