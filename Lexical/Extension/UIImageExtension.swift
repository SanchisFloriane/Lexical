//
//  UIImageExtension.swift
//  Lexical
//
//  Created by Floriane Sanchis on 01/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setRounded() {
        let radius = (self.frame).width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func maskCircle(anyImage: UIImage) {
        self.contentMode = UIViewContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        // make square(* must to make circle),
        // resize(reduce the kilobyte) and
        // fix rotation.
        self.image = anyImage
    }
    
    func circle(image: UIImage, borderWidth: CGFloat, colorBorder: CGColor, x: Int, y:Int, width: Int, height: Int) -> UIImageView
    {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        imageView.image = image
        imageView.layer.borderWidth=borderWidth //1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = colorBorder
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    
}

