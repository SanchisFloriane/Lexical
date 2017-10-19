//
//  DesignDisplayWordListUIView.swift
//  Lexical
//
//  Created by Floriane Sanchis on 19/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class DesignDisplayWordListUIView: UIView
{
    @IBOutlet weak var carouselTheme: LexicalICarousel!
    @IBOutlet weak var carouselSubTheme: LexicalICarousel!
    @IBOutlet weak var lblTheme: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let screenWidth : CGFloat! = UIScreen.main.bounds.width
    let screenHeight : CGFloat! = UIScreen.main.bounds.height
    let heightStatusBar = UIApplication.shared.statusBarFrame.size.height
    
    var rectTheme : CGRect!
    var rectSubTheme : CGRect!
    
    let heightRect : Double = Double(30)
    var sizeRect : CGSize!
    let widthBorderRect : CGFloat = 2
    let colorBorderRect : CGColor = UIColor.blue.cgColor
    
    let heightCarousel : Double = 75
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //Context is the object used for drawing
        
        let context = UIGraphicsGetCurrentContext()
        
        /****** Draw rectangle ******/
        sizeRect = CGSize(width: getWidthRect(), height: heightRect)
        
        //Rectangle Theme
        drawTheme(context: context!)
        
        //Draw the design
        context?.strokePath()
        
        /****** Draw labels  ******/
        
        lblTheme.frame.origin = rectTheme.origin
        lblTheme.frame.size = sizeRect
        lblTheme.text = NSLocalizedString("THEME", comment: "")
        
           /****** End draw labels  ******/
    }
    
    //Get x position for rectangles
    func getXPositionRect() -> Double
    {
        return Double(widthBorderRect - 1)
    }
    
    //Get width for rectangles
    func getWidthRect() -> Double
    {
        return Double(self.screenWidth - widthBorderRect)
    }
    
    //Design rect and add it to the context
    func drawRect(rect : CGRect, context : CGContext)
    {
        context.setLineWidth(widthBorderRect)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addRect(rect)
    }
    
    func getTopTableView() -> Double
    {
        return Double(tableView.frame.origin.y)
    }
    
    func getTopRectTheme() -> Double
    {
       return getTopTableView() - heightRect - Double(widthBorderRect - 1)
    }
    //Draw rectTheme
    func drawTheme(context : CGContext)
    {
        let yPosition = getTopRectTheme()
        let point = CGPoint(x: getXPositionRect(), y: yPosition)
        
        rectTheme = CGRect(origin: point, size: sizeRect)
        
        drawRect(rect: rectTheme, context: context)
    }
    
    //Get bottom of the rectSubTheme
    func getPositionBottomCarouselTheme() -> Double
    {
        return Double(carouselTheme.frame.origin.y) + heightCarousel
    }
    
    //Get top screen
    func getPositionTopScreen() -> Double
    {
        return Double(UIApplication.shared.statusBarFrame.size.height + (widthBorderRect-1)) +  LexicalConstant().NAVIGATIONBAR_HEIGHT + Double(heightCarousel)
    }
 

}
