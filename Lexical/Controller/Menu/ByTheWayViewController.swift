//
//  ByTheWayViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 07/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import Foundation

class ByTheWayViewController : UIViewController
{
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var lblTitleByTheWay: UILabel!
    @IBOutlet weak var lblNameAndVersionApplication: UILabel!
    @IBOutlet weak var lblDevelopedBy: UILabel!
    @IBOutlet weak var lblPrivacyPolicy: UILabel!
    @IBOutlet weak var lblLicense: UILabel!
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    //Do additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        lblTitleByTheWay.text = NSLocalizedString("BY_THE_WAY", comment: "")
        lblNameAndVersionApplication.text = NSLocalizedString("NAME_APPLICATION", comment: "") + " V" + version!
        lblDevelopedBy.text = NSLocalizedString("DEVELOPED_BY", comment: "")
        lblPrivacyPolicy.text = NSLocalizedString("PRIVACY_POLICY", comment: "")
        lblLicense.text = NSLocalizedString("LICENSE", comment: "")
    }
    
    
    //Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
