//
//  TestTableViewCell.swift
//  LayoutTutorial
//
//  Created by 臧其龙 on 16/3/5.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

private let kLabelHeight:CGFloat = 21
private let kSpacing:CGFloat = 16;

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    var itemCount:Int?
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
      
    }
    
    func reloadCollectionView() {
       
    }
    
    func bindWithData(data:TestModel) -> CGFloat {
        itemCount = data.buttonCount
        buttonCollectionView.reloadData()
        collectionViewHeightConstraint.constant = buttonCollectionView.collectionViewLayout.collectionViewContentSize().height;
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
      
        
        return kLabelHeight + kSpacing + 20 + collectionViewHeightConstraint.constant
    }

}

private let kInsideCollectionViewCellID = "kInsideCollectionViewCellID"

extension TestTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kInsideCollectionViewCellID, forIndexPath: indexPath) as! InsideCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let number = itemCount {
            return number
        }
        return 0
    }
}

