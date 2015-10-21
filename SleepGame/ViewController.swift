//
//  ViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/08.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserID: UITextField!
    @IBOutlet weak var UserPASS: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let config = NSUserDefaults.standardUserDefaults()
        config.setObject("71241784",forKey:"UserID")
        config.setObject("00000000",forKey:"UserPASS")
        config.synchronize()
        // 設定値の取得
        let result : AnyObject! = config.objectForKey("UserID")
        let result2 : AnyObject! = config.objectForKey("UserPASS")
        print(result)
        print(result2)
        UserID.text = result as? String
        UserPASS.text = result2 as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

