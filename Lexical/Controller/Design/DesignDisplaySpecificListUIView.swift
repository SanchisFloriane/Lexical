//
//  DesignUIView.swift
//  Lexical
//
//  Created by Floriane Sanchis on 12/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class DesignDisplaySpecificListUIView: UIView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var lblTheme: UILabel!
    @IBOutlet weak var lblSubTheme: UILabel!
    @IBOutlet weak var lblExercice: UILabel!
    @IBOutlet weak var carouselTheme: LexicalICarousel!
    @IBOutlet weak var carouselSubTheme: LexicalICarousel!
    @IBOutlet weak var carouselExercice: LexicalICarousel!
    
    let screenWidth : CGFloat! = UIScreen.main.bounds.width
    let screenHeight : CGFloat! = UIScreen.main.bounds.height
    let heightStatusBar = UIApplication.shared.statusBarFrame.size.height
    
    var rectTheme : CGRect!
    var rectSubTheme : CGRect!
    var rectExercice : CGRect!
    
    let heightRect : Double = Double(30)
    var sizeRect : CGSize!
    let widthBorderRect : CGFloat = 2
    let colorBorderRect : CGColor = UIColor.blue.cgColor
    
    let heightCarousel : Double = 75
    
    override func draw(_ rect: CGRect) {
   
        //Context is the object used for drawing
       
        let context = UIGraphicsGetCurrentContext()
        
        /****** Draw rectangle ******/
        sizeRect = CGSize(width: getWidthRect(), height: heightRect)
        
        //Rectangle Theme
        drawTheme(context: context!)
        
        //Rectangle SubTheme
        drawSubTheme(context: context!)
        
        //Rectangle Exercice
        drawExercice(context: context!)
        
        /****** End draw rectangle ******/
        
        //Draw the design
        context?.strokePath()
        
        /****** Draw labels  ******/
        
        lblTheme.frame.origin = rectTheme.origin
        lblTheme.frame.size = sizeRect
        lblTheme.text = NSLocalizedString("THEME", comment: "")
        
        lblSubTheme.frame.origin = rectSubTheme.origin
        lblSubTheme.frame.size = sizeRect
        lblSubTheme.text = NSLocalizedString("SUBTHEME", comment: "")
     
        lblExercice.frame.origin = rectExercice.origin
        lblExercice.frame.size = sizeRect
        lblExercice.text = NSLocalizedString("EXERCICE", comment: "")
        
        /****** End draw labels  ******/

        //Draw tabBar
        drawTabBar()
        
        //Draw carousel for rect theme
        drawCarouselTheme()
        
        //Draw carousel for rect subTheme
        drawCarouselSubTheme()
        
        //Draw carousel for rect exercice
        drawCarouselExercice()
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
    
    //Get top screen
    func getPositionTopScreen() -> Double
    {
        return Double(UIApplication.shared.statusBarFrame.size.height + searchBar.getHeight() + (widthBorderRect-1))
    }
    
     //Get bottom of the rectTheme
    func getPositionBottomRectTheme() -> Double
    {
        return Double(rectTheme.origin.y) + heightRect
    }
    
     //Get bottom of the rectSubTheme
    func getPositionBottomRectSubTheme() -> Double
    {
        return Double(rectSubTheme.origin.y) + heightRect
    }
    
    //Get bottom of the rectExercice
    func getPositionBottomRectExercice() -> Double
    {
        return Double(rectExercice.origin.y) + heightRect
    }
 
    //Design rect and add it to the context
    func drawRect(rect : CGRect, context : CGContext)
    {
        context.setLineWidth(widthBorderRect)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.addRect(rect)
    }
    
    //Draw rectTheme
    func drawTheme(context : CGContext)
    {
        let yPosition = getPositionTopScreen()
        let point = CGPoint(x: getXPositionRect(), y: yPosition)
        
        rectTheme = CGRect(origin: point, size: sizeRect)
        
        drawRect(rect: rectTheme, context: context)
    }
    
    //Draw rectSubTheme
    func drawSubTheme(context : CGContext)
    {
        let yPosition = getSpaceBetweenRect() + getPositionBottomRectTheme()
        let point = CGPoint(x: getXPositionRect(), y: yPosition)
  
        rectSubTheme = CGRect(origin: point, size: sizeRect)
        
        drawRect(rect: rectSubTheme, context: context)
    }
    
    //Draw rectExercice
    func drawExercice(context : CGContext)
    {
        let yPosition = getSpaceBetweenRect() + getPositionBottomRectSubTheme()
        let point = CGPoint(x: getXPositionRect(), y: yPosition)
        
        rectExercice = CGRect(origin: point, size: sizeRect)
        
        drawRect(rect: rectExercice, context: context)
    }
    
    //Calculate space beetween rect
    func getSpaceBetweenRect() -> Double
    {
        let caseHeightScreen = (screenHeight-heightStatusBar-searchBar.getHeight()-tabBar.getHeight())/CGFloat(3)
        return Double(caseHeightScreen - sizeRect.height)
    }
    
    //Draw the tabBar
    func drawTabBar()
    {
        let pointTabBar = CGPoint(x: 0, y: getPositionBottomRectExercice() + getSpaceBetweenRect())
        
        let sizeTabBar = CGSize(width: screenWidth, height: searchBar.getHeight())
        
        tabBar.frame.origin = pointTabBar
        tabBar.frame.size = sizeTabBar
    }
    
    //Get marge carousel from rect above
    func getMargeCarousel() -> Double
    {
        return (getSpaceBetweenRect() - heightCarousel)/2;
    }
    
    //Draw carousel for rect theme
    func drawCarouselTheme()
    {
        let yPosition = Double(getMargeCarousel()+getPositionBottomRectTheme())
        
        let pointCarousel = CGPoint(x: 0, y: yPosition)
        
        let sizeCarousel = CGSize(width: Double(screenWidth), height: heightCarousel)
        
        carouselTheme.frame.origin = pointCarousel
        carouselTheme.frame.size = sizeCarousel
    }
    
    //Draw carousel for rect subTheme
    func drawCarouselSubTheme()
    {
        let pointCarousel = CGPoint(x: 0, y: (getPositionBottomRectSubTheme() + getMargeCarousel()))
        
        let sizeCarousel = CGSize(width: Double(screenWidth), height: heightCarousel)
        
        carouselSubTheme.frame.origin = pointCarousel
        carouselSubTheme.frame.size = sizeCarousel
    }
    
    //Draw carousel for rect exercice
    func drawCarouselExercice()
    {
        let pointCarousel = CGPoint(x: 0, y: (getPositionBottomRectExercice() + getMargeCarousel()))
        
        let sizeCarousel = CGSize(width: Double(screenWidth), height: heightCarousel)
        
        carouselExercice.frame.origin = pointCarousel
        carouselExercice.frame.size = sizeCarousel
    }
}
