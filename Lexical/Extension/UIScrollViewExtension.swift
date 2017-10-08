//
//  UIScrollViewExtension.swift
//  Lexical
//
//  Created by Floriane Sanchis on 07/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

extension UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func resizeScrollViewContentSize()
    {
        var contentRect = CGRect.zero
        for view in self.subviews
        {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize = contentRect.size
        
    }
}
