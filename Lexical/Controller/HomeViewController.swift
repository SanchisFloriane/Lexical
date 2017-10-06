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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Utilisation du menu
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        /***** Creation images liste *****/
        var x : Int = 35
        var y : Int = 100
        let width : Int = 105
        let height : Int = 105
        let center : Int = 40
        let ligne : Int = 25
        var image = UIImage(named: "france.png")
        var imageView = UIImageView()
        imageView = imageView.circle(image: image!, borderWidth: 2, colorBorder: UIColor.white.cgColor, x: x, y: y, width: width, height: height)
        view.addSubview(imageView)
        
        x = x+width + center
        image = UIImage(named: "germany.png")
        imageView = UIImageView()
        imageView = imageView.circle(image: image!, borderWidth: 2, colorBorder: UIColor.white.cgColor, x: x, y: y, width: width, height: height)
        view.addSubview(imageView)
        
        x = 35
        y = y + height + ligne
        image = UIImage(named: "china.png")
        imageView = UIImageView()
        imageView = imageView.circle(image: image!, borderWidth: 2, colorBorder: UIColor.white.cgColor, x: x, y: y, width: width, height: height)
        view.addSubview(imageView)
        /**************************/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

