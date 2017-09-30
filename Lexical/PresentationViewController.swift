//
//  PresentationViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 30/09/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import Foundation

class PresentationViewController : UIViewController
{
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Creation of a timer which call the "delayedAction" after 5 sec
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(delayedAction), userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Pass to the homeController
    @objc func delayedAction (){
        
        //Call the mainStoryBoard
        let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        //Creation of UIViewController
        let desController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
     
        //Change of UIViewController
        self.present(desController, animated: true, completion: nil)
    }
    
}
