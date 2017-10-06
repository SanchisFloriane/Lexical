//
//  MessageViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 30/09/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit
import DLRadioButton

class AddListViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {
    
    @IBOutlet weak var btnBackToHome: UIBarButtonItem!
    @IBOutlet weak var btnAddList: UIBarButtonItem!
    @IBOutlet weak var btnNewList: DLRadioButton!
    @IBOutlet weak var txtDescriptionList: UITextView!
    @IBOutlet weak var txtNameList: UITextField!
    @IBOutlet var carouselView: iCarousel!
    
    var indexLastSubViewCarousel : Int?
    
    var listImgCarousel = ["france.png","germany.png","china.png","canada.png", "united-kingdom.png", "switzerland.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnNewList.isMultipleSelectionEnabled = true
        txtDescriptionList.layer.borderColor = UIColor.black.cgColor
        txtDescriptionList.layer.borderWidth = 1
        
        carouselView.type = .cylinder //linear, cylinder, rotary, wheel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func isNewList(_ sender: DLRadioButton){
        print("\(String(sender.isSelected))") // affiche true ou false
    }
    
    //Number of image in the carousel
    func numberOfItems(in carousel: iCarousel) -> Int {
        return listImgCarousel.count
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        //Define the space between UIImage
        if option == iCarouselOption.spacing
        {
            return value * 1.1
        }
        
        return value
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView
    {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tempView.backgroundColor = UIColor.blue
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let img = UIImage(named: listImgCarousel[index])
        button.setImage(img, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        tempView.addSubview(button)
        return tempView
    }
    
    
    //Get the UIImage selected
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        if indexLastSubViewCarousel != nil{
            carouselView.itemView(at: indexLastSubViewCarousel!)?.subviews[0].layer.borderColor = UIColor.black.cgColor
        }
        //Change border color of selected item
        carouselView.itemView(at: carousel.currentItemIndex)?.subviews[0].layer.borderColor = UIColor.blue.cgColor
        indexLastSubViewCarousel = carousel.currentItemIndex
        
        //get the name of the UIImage
        print("\(listImgCarousel[carousel.currentItemIndex])")
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
