//
//  UIViewControllerExtension.swift
//  Lexical
//
//  Created by Floriane Sanchis on 13/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedArround(searchBar : UISearchBar)
    {
        let recognizer = ObjectUITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard(_:)))
        recognizer.searchBar = searchBar
        recognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(recognizer)
        searchBar.showsCancelButton = true
    }
    
    //Hide keyboard
    @objc func dismissKeyboard(_ recognizer: ObjectUITapGestureRecognizer)
    {
        recognizer.searchBar!.endEditing(true)
    }
    
    //Darken of imgToLearn
    @objc func addDarkenImgToLearn(_ recognizer: ObjectUITapGestureRecognizer)
    {
        recognizer.imgToLearn!.layer.opacity = LexicalConstant().IMGVIEW_DARKEN_OPACITY
        addRecognizerToLearn(imgToLearn: recognizer.imgToLearn!)
    }
    
    //Remove gray layer of imgToLearn
    @objc func removeDarkenImgToLearn(_ recognizer: ObjectUITapGestureRecognizer)
    {
        recognizer.imgToLearn!.layer.opacity = LexicalConstant().IMGVIEW_NO_DARKEN_OPACITY
        addRecognizerToLearn(imgToLearn: recognizer.imgToLearn!)
    }
   
   
    //Addition of the touch up inside action on imgToLearn
    func addRecognizerToLearn(imgToLearn: UIImageView)
    {
        imgToLearn.isUserInteractionEnabled = true
        let recognizer : ObjectUITapGestureRecognizer!
       
        //If imageview is darked
        if getOpacity(imageView: imgToLearn) == LexicalConstant().IMGVIEW_DARKEN_OPACITY
        {
            recognizer = ObjectUITapGestureRecognizer(target: self, action: #selector(removeDarkenImgToLearn(_:)))
        }
        else
        {
            recognizer = ObjectUITapGestureRecognizer(target: self, action: #selector(addDarkenImgToLearn(_:)))
        }
        
        recognizer.imgToLearn = imgToLearn
        imgToLearn.addGestureRecognizer(recognizer)
    }
    
    func getOpacity(imageView: UIImageView) -> Float
    {
        return imageView.layer.opacity
    }
    
    //Darken of imgToNew
    @objc func addDarkenImgToNew(_ recognizer: ObjectUITapGestureRecognizer)
    {
        recognizer.imgToNew!.layer.opacity = LexicalConstant().IMGVIEW_DARKEN_OPACITY
        addRecognizerToNew(imgToNew: recognizer.imgToNew!)
    }
    
    //Remove gray layer of imgToNew
    @objc func removeDarkenImgToNew(_ recognizer: ObjectUITapGestureRecognizer)
    {
        recognizer.imgToNew!.layer.opacity = LexicalConstant().IMGVIEW_NO_DARKEN_OPACITY
        addRecognizerToNew(imgToNew: recognizer.imgToNew!)
    }
    
    //Addition of the touch up inside action on imgToNew
    func addRecognizerToNew(imgToNew: UIImageView)
    {
        imgToNew.isUserInteractionEnabled = true
        let recognizer : ObjectUITapGestureRecognizer!
        
        //If imageview is darked
        if getOpacity(imageView: imgToNew) == LexicalConstant().IMGVIEW_DARKEN_OPACITY
        {
            recognizer = ObjectUITapGestureRecognizer(target: self, action: #selector(removeDarkenImgToNew(_:)))
        }
        else
        {
            recognizer = ObjectUITapGestureRecognizer(target: self, action: #selector(addDarkenImgToNew(_:)))
        }
        
        recognizer.imgToNew = imgToNew
        imgToNew.addGestureRecognizer(recognizer)
    }
    
    
}
