//
//  FrameLayoutView.swift
//  LayoutTutorial
//
//  Created by 臧其龙 on 16/3/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class FrameLayoutView: UIView {
    
    let redView = UIView()
    let yellowView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blackColor()
        
        redView.backgroundColor = UIColor.redColor()
        redView.frame = CGRectInset(self.bounds, 10, 10)
        self.addSubview(redView)
        
        yellowView.backgroundColor = UIColor.yellowColor()
        
        self.addSubview(yellowView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        yellowView.frame = CGRectInset(self.bounds, 20, 20)
    }

}
