//
//  LexicalICarousel.swift
//  Lexical
//
//  Created by Floriane Sanchis on 13/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class LexicalICarousel: iCarousel, iCarouselDelegate, iCarouselDataSource {
    
    var listImage = [UIImage]()
    var indexLastSubViewCarousel : Int?
    let colorBorderSelectedItem : CGColor = UIColor.blue.cgColor
    let colorBorderNotSelectedItem : CGColor = UIColor.black.cgColor
    
    //Get listImage
    public func getListImage() -> [UIImage]
    {
       return listImage
    }
    
    //Set listImage
    public func setListImage(listImg: [UIImage])
    {
        self.listImage = listImg
    }
    
    //Set listImage and return the number of image in the carousel
    func numberOfItems(in carousel: iCarousel, listImg: [UIImage]) -> Int {
        
        setListImage(listImg: listImg)
        return numberOfItems(in: carousel)
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int
    {
        return listImage.count
    }
    
    //Define options for carousel
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        //Define the space between UIImage
        switch (option)
        {
            case .spacing:
            return value * 1.1
            //Infinite loop items
            case .wrap:
            return 1
            
            default:
            return value
        }
    }
    
    //When carousel is loading
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView
    {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        let img = listImage[index]
        button.setImage(img, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.borderColor = colorBorderNotSelectedItem
        button.layer.borderWidth = 2
        tempView.addSubview(button)
        return tempView
    }
    
    //Change border color of selected item
    func setBorderColorImage(index: Int)
    {
        itemView(at: index)?.subviews[0].layer.borderColor = colorBorderSelectedItem
    }
    
    //Change size border of selected item
    func setBorderSizeImage(index: Int)
    {
        itemView(at: index)?.subviews[0].layer.borderWidth = 2
    }
    
    //Get the UIImage selected
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel)
    {
        if indexLastSubViewCarousel != nil{
            carousel.itemView(at: indexLastSubViewCarousel!)?.subviews[0].layer.borderColor = colorBorderNotSelectedItem
        }
        
        //Change border color of selected item
        self.setBorderColorImage(index: carousel.currentItemIndex)
        self.setBorderSizeImage(index: carousel.currentItemIndex)
        indexLastSubViewCarousel = carousel.currentItemIndex
    }
    
    //Return true if the carousel[numberItem] is selected
    func itemSelected(_ carousel: iCarousel, numberItem: Int) -> Bool
    {
        if carousel.itemView(at: numberItem)!.subviews[0].layer.borderColor == colorBorderNotSelectedItem
        {
            return true
        }
        return false
    }
}
