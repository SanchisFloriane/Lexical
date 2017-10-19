//
//  DisplayWordListController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 15/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import Foundation

class DisplayWordListViewController: UIViewController,iCarouselDataSource,UISearchBarDelegate, iCarouselDelegate,UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var carouselTheme: LexicalICarousel!
    @IBOutlet weak var carouselSubTheme: LexicalICarousel!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var indexLastSubViewCarousel : Int?
    
    var wordOfList = ["france.png", "germany.png","china.png","united-kingdom.png","switzerland.png","canada.png"]
    
    var listImgCarousel : [UIImage] = [UIImage(named:"france.png")!,UIImage(named:"germany.png")!,UIImage(named:"china.png")!,UIImage(named:"canada.png")!, UIImage(named:"united-kingdom.png")!, UIImage(named:"switzerland.png")!]
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        btnBack.title = NSLocalizedString("BACK", comment : "")
        
        //Draw carousel theme
        drawCarouselTheme()
        //Draw carousel subTheme
        drawCarouselSubTheme()
    }
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Return the number of sections
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    //Return the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordOfList.count
    }
    
    
    //Display the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lexicalSearchTableViewCell", for: indexPath) as! LexicalSearchTableViewCell
        
        let word : String!
        
        word = wordOfList[indexPath.row]
        
        cell.nameWord?.text = word
        cell.traductionWord?.text = "Traduction word"
        addRecognizerToLearn(imgToLearn: cell.imgToLearn!)
        addRecognizerToNew(imgToNew: cell.imgToNew!)
        return cell
    }
    
    
    //Draw carousel for theme
    func drawCarouselTheme()
    {
        carouselTheme.type = .linear
    }
    
    //Draw carousel for subTheme
    func drawCarouselSubTheme()
    {
        carouselSubTheme.type = .linear
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
        
        if carouselTheme.itemSelected(carouselTheme, numberItem: carouselTheme.currentItemIndex)
        {
           view.bringSubview(toFront: carouselSubTheme)
           carouselSubTheme.isUserInteractionEnabled = true
            view.sendSubview(toBack: carouselTheme)
        }
    }
    
    @IBAction func goToDisplaySpecificList()
    { 
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        //Call the mainStoryBoard
        let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        //Creation of UIViewController
        let desController = mainStoryboard.instantiateViewController(withIdentifier: "DisplaySpecificListViewController") as! DisplaySpecificListViewController
        
        //Change of UIViewController
        let newFrontViewController = UINavigationController.init(rootViewController:desController)
        revealViewController.pushFrontViewController(newFrontViewController, animated: true)
    }
    
}
