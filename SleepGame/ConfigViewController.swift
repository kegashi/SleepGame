//
//  ConfigViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/16.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    @IBOutlet weak var logout: UIButton!
    var config = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.]
        logout.addTarget(self, action: "loginfunc:", forControlEvents: UIControlEvents.TouchDown)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginfunc(sender: AnyObject){
        config.setObject("" ,forKey:"UserID")
        config.setObject("" ,forKey:"UserPASS")
        config.synchronize()
        performSegueWithIdentifier("logout", sender: self)

    }
    
}