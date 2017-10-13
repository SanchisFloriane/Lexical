//
//  DisplaySpecificListViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 08/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class DisplaySpecificListViewController: UIViewController, UISearchBarDelegate, iCarouselDataSource, iCarouselDelegate {
    
    
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var carouselTheme: LexicalICarousel!
    @IBOutlet weak var carouselSubTheme: LexicalICarousel!
    @IBOutlet weak var carouselExercice: LexicalICarousel!
    
    var indexLastSubViewCarousel : Int?
    
    var listImgCarousel : [UIImage] = [UIImage(named:"france.png")!,UIImage(named:"germany.png")!,UIImage(named:"china.png")!,UIImage(named:"canada.png")!, UIImage(named:"united-kingdom.png")!, UIImage(named:"switzerland.png")!]
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Draw carousel theme
        drawCarouselTheme()
        //Draw carousel subtheme
        drawCarouselSubTheme()
        //Draw carousel exercice
        drawCarouselExercice()
        
        //Put the searchbar inside navigationBar
        navigationBar.titleView = searchBar
        
        //Load the menu button
        if revealViewController() != nil {
            btnMenu.target = revealViewController()
            btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        //Creation of menuController
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        //Call the mainStoryBoard
        let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        //Creation of UIViewController
        let desController = mainStoryboard.instantiateViewController(withIdentifier: "SearchTableViewController") as! SearchTableViewController
        
        let newFrontViewController = UINavigationController.init(rootViewController:desController)
        revealViewController.pushFrontViewController(newFrontViewController, animated: true)
       
        return true
    }
    
    //Draw carousel for rect theme
    func drawCarouselTheme()
    {
        carouselTheme.type = .linear
    }
    
    //Draw carousel for rect subTheme
    func drawCarouselSubTheme()
    {
        carouselSubTheme.type = .linear
    }
    
    //Draw carousel for rect exercice
    func drawCarouselExercice()
    {
        carouselExercice.type = .linear
    }
        
    func numberOfItems(in carousel: iCarousel) -> Int {
       
        if carousel == carouselTheme
        {
            return carouselTheme.numberOfItems(in: carouselTheme, listImg: listImgCarousel)
        }
        else if carousel == carouselSubTheme
        {
            return carouselSubTheme.numberOfItems(in: carouselSubTheme, listImg: listImgCarousel)
        }
        else if carousel == carouselExercice
        {
            return carouselExercice.numberOfItems(in: carouselExercice, listImg: listImgCarousel)
        }
        
        return 0
    }
    
     //Define options for carousel
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if carousel == carouselTheme
        {
            return carouselTheme.carousel(_:carouselTheme,valueFor:option,withDefault:value)
        }
        else if carousel == carouselSubTheme
        {
            return carouselSubTheme.carousel(_:carouselSubTheme,valueFor:option,withDefault:value)
        }
        else if carousel == carouselExercice
        {
            return carouselExercice.carousel(_:carouselExercice,valueFor:option,withDefault:value)
        }
        
        return 0
    }
    
    //When carousel is loading
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        if carousel == carouselTheme
        {
            return carouselTheme.carousel(_:carouselTheme,viewForItemAt:index,reusing:view)
        }
        else if carousel == carouselSubTheme
        {
            return carouselSubTheme.carousel(_:carouselSubTheme,viewForItemAt:index,reusing:view)
        }
        else if carousel == carouselExercice
        {
            return carouselExercice.carousel(_:carouselExercice,viewForItemAt:index,reusing:view)
        }
        
        return UIView()
    }
    
    //Get the UIImage selected
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel)
    {
        if carousel == carouselTheme
        {
            return carouselTheme.carouselDidEndScrollingAnimation(_:carouselTheme)
        }
        else if carousel == carouselSubTheme
        {
            return carouselSubTheme.carouselDidEndScrollingAnimation(_:carouselSubTheme)
        }
        else if carousel == carouselExercice
        {
            return carouselExercice.carouselDidEndScrollingAnimation(_:carouselExercice)
        }
    }
    
    
       
}
