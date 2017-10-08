//
//  ViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 29/09/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var btnGoToAddList: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var screenWidth : CGFloat = UIScreen.main.bounds.width
    var screenHeight : CGFloat = UIScreen.main.bounds.height
    let iconListWidth : CGFloat = 105
    let iconListHeight : CGFloat = 105
    
    // Do any additional setup after loading the view, typically from a nib.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Utilisation du menu
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
             screenHeight = scrollView.frame.size.height
        //Display the list of user
        displayList()
        
        //Resize the scrollView
        scrollView.resizeScrollViewContentSize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Display lists of user
    func displayList(){
        
        //Get lists of the user
        let listsUser = [UIImage(named: "france.png"),UIImage(named: "germany.png"),UIImage(named: "china.png"),UIImage(named: "united-kingdom.png"),UIImage(named: "switzerland.png"),UIImage(named: "canada.png"),UIImage(named: "france.png"),UIImage(named: "germany.png"),UIImage(named: "france.png"),UIImage(named: "germany.png")]
        
        /** Display the lists's users **/
        
        //Calculate the width
        let middleWidthScreen = screenWidth/2
        let freeWidthSpaceCase = middleWidthScreen - iconListWidth
        let margeWidth = freeWidthSpaceCase/2
        
        //Calculate the height
        let caseHeightScreen = screenHeight/CGFloat(listsUser.count/2)
        let freeHeightSpaceCase = caseHeightScreen - iconListHeight
        let margeHeight = (freeHeightSpaceCase/2)
     
        var line : Int = 0
        var column : Int = 0
        
        var xPosition : CGFloat = 0
        var yPosition : CGFloat = 0
        
        for image in listsUser
        {
            if addLine(line: line, column : column) && !addColumn(column : column)
            {
                xPosition = margeWidth
                yPosition = yPosition + caseHeightScreen
                column = 1
            }
            else if !addLine(line: line, column : column) && addColumn(column : column)
            {
                xPosition = middleWidthScreen + margeWidth
                line+=1
                column = 0
            }
            else
            {
                xPosition = margeWidth
                yPosition = margeHeight
                column+=1
            }
            
            var imageView = UIImageView()
            imageView = imageView.circle(image: image!, borderWidth: 2, colorBorder: UIColor.white.cgColor, x: xPosition, y: yPosition, width: iconListWidth, height: iconListHeight)
            scrollView.addSubview(imageView)
        }
        /**************************/
    }
    
    func addLine(line : Int, column : Int) -> Bool
    {
        if line > 0 && column == 0
        {
            return true
        }
        
        return false
    }
    
    func addColumn(column : Int) -> Bool
    {
        if column == 1
        {
            return true
        }
        
        return false
    }

    // Pass to the homeController
    func goToAddListViewController (){
        
        //Call the mainStoryBoard
        let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        //Creation of UIViewController
        let desController = mainStoryboard.instantiateViewController(withIdentifier: "AddListViewController") as! AddListViewController
        
        //Change of UIViewController
        self.present(desController, animated: true, completion: nil)
    }
     
    
}

