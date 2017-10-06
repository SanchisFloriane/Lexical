//
//  MenuViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 29/09/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import Foundation

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sectionMenu : Array = [String]()
    var imgIconeMenu : Array = [UIImage]()
    
    @IBOutlet weak var imgProfileMenu: UIImageView!
    @IBOutlet weak var lblPseudo: UILabel!
    
    //Do any additional setup after loading the view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creation sections
        sectionMenu = getNameSectionMenu()
        imgIconeMenu = getImgIconeMenu()
        
        //Creation profile
        imgProfileMenu.layer.borderColor = UIColor.red.cgColor
        imgProfileMenu.layer.borderWidth = 2
        imgProfileMenu.layer.cornerRadius = 50
        imgProfileMenu.layer.masksToBounds = false
        imgProfileMenu.clipsToBounds = true
        
        lblPseudo.text = "Futur pseudo ..."
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Configure the number of section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionMenu.count
    }
    
    //Initialisation of cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.imgIconMenu.image = imgIconeMenu[indexPath.row]
        cell.lblMenuName.text! = sectionMenu[indexPath.row]
        
        return cell
    }
    
    //Detection of section selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.lblMenuName.text == "Home"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
      /*  else if cell.lblMenuName.text == "Nom"
        {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "AddListViewController") as! AddListViewController
            
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }*/
    }
    
    func getNameSectionMenu() -> [String]
    {
        return [NSLocalizedString("ACCOUNT",comment:""),
                NSLocalizedString("STATISTICS",comment:""),
                NSLocalizedString("STORE",comment:""),
                NSLocalizedString("PURCHASE",comment:""),
                NSLocalizedString("PARAMETERS",comment:""),
                NSLocalizedString("EVALUATION",comment:""),
                NSLocalizedString("PAGE_FACEBOOK",comment:""),
                NSLocalizedString("BY_THE_WAY",comment:"")]
    }
    
    func getImgIconeMenu() -> [UIImage]
    {
        return [UIImage(named: "home")!,UIImage(named: "message")!,UIImage(named: "map")!,UIImage(named: "setting")!,UIImage(named: "home")!,UIImage(named: "home")!,UIImage(named: "home")!,UIImage(named: "home")!]
    }
    
}
