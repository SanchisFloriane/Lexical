//
//  DisplaySpecificListViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 08/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class DisplaySpecificListViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Put the searchbar inside navigationBar
        navigationBar.titleView = searchBar
        
        //Load the menu button
        if revealViewController() != nil {
            btnMenu.target = revealViewController()
            btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
