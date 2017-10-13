//
//  CGRectExtension.swift
//  Lexical
//
//  Created by Floriane Sanchis on 13/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import Foundation

extension CGRect
{
    func centerText(string : NSString, withAttributes attributes : [NSAttributedStringKey: Any]) -> CGRect
    {
        let size = string.size(withAttributes: attributes)
        return CGRect(x: self.origin.x, y: self.origin.y + (self.size.height-size.height)/2.0, width: self.size.width, height: self.size.height)
    }
}
