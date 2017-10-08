//
//  UpdateThemeViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 08/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit
import DLRadioButton

class UpdateThemeViewController: UIViewController, iCarouselDelegate, iCarouselDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtNameTheme: UITextField!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var txtDescriptionTheme: UITextView!
    @IBOutlet weak var btnNewTheme: DLRadioButton!
    @IBOutlet var carouselView: iCarousel!
    @IBOutlet weak var btnImportImage: UIButton!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var btnUpdateTheme: UIBarButtonItem!
    
    var indexLastSubViewCarousel : Int?
    
    var listImgCarousel = [UIImage(named:"france.png"),UIImage(named:"germany.png"),UIImage(named:"china.png"),UIImage(named:"canada.png"), UIImage(named:"united-kingdom.png"), UIImage(named:"switzerland.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnNewTheme.isMultipleSelectionEnabled = true
        btnNewTheme.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        
        txtDescriptionTheme.layer.borderColor = UIColor.black.cgColor
        txtDescriptionTheme.layer.borderWidth = 1
        
        lblName.text = NSLocalizedString("NAME", comment: "")
        lblDescription.text = NSLocalizedString("DESCRIPTION", comment: "")
        btnBack.title = NSLocalizedString("BACK_GESTION", comment :"")
        carouselView.type = .cylinder //linear, cylinder, rotary, wheel
        
        btnNewTheme.setTitle(NSLocalizedString("NEW_THEME", comment: ""), for: UIControlState.normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func isNewTheme(_ sender: DLRadioButton){
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
        let img = listImgCarousel[index]
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
        setBorderColorImage(index: carousel.currentItemIndex)
        indexLastSubViewCarousel = carousel.currentItemIndex
    }
    
    //Change border color of selected item
    func setBorderColorImage(index: Int)
    {
        carouselView.itemView(at: index)?.subviews[0].layer.borderColor = UIColor.blue.cgColor
    }
    
    //Creation of the menu import image
    @IBAction func chooseImage(_ sender: Any){
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        //Creation menu import image
        let actionSheet = UIAlertController(title: NSLocalizedString("TITLE_IMPORT_PHOTO_SOURCE",comment:""), message: NSLocalizedString("MESSAGE_IMPORT_PHOTO_SOURCE",comment:""), preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            actionSheet.addAction(UIAlertAction(title: NSLocalizedString("TITLE_IMPORT_PHOTO_FROM_CAMERA",comment:""), style: .default, handler: { (action: UIAlertAction) in imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }else{
            print(NSLocalizedString("CAMERA_NOT_AVAILABLE",comment:""))
        }
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("TITLE_IMPORT_PHOTO_FROM_PHOTO_LIBRARY",comment:""), style: .default, handler: { (action: UIAlertAction) in imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("ACTION_CANCEL",comment:""), style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    //Add the image to the carousel
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //Get the image
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //Add to array
        listImgCarousel.append(image)
        
        //Reload the carousel
        carouselView.reloadData()
        
        //Select the image
        carouselView.scrollToItem(at: listImgCarousel.count-1, animated: true)
        //Change border's color of the image
        setBorderColorImage(index: listImgCarousel.count-1)
        
        indexLastSubViewCarousel = carouselView.currentItemIndex
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Cancel the addition
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
