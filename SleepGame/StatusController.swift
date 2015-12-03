//
//  StatusController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/16.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class StatusController: UIViewController {
    
    @IBOutlet weak var UserImg: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserBar: UIProgressView!
    
    @IBOutlet weak var UserRank: UILabel!
    //@IBOutlet weak var UserDays: UILabel!
    @IBOutlet weak var UserExp: UILabel!
    
    var user = UserAPI.User()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let config = NSUserDefaults.standardUserDefaults()
        let result : AnyObject! = config.objectForKey("UserID")
        user = UserAPI().getData(result as! String)//"71241781")
        //ユーザの画像の読み込み
        let img_url = SleepGameAPI.img + user.picurl!
        let url = NSURL(string: img_url)
        let imgData: NSData
        do {
            imgData = try NSData(contentsOfURL:url!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let img = UIImage(data:imgData);
            UserImg.image = img
        } catch {
            print("Error: can't create image.")

        }
        UserName.text = user.username
        UserBar.progress = 1 - (Float(user.next!) / 80)
        UserExp.text = "次レベルまで:" + String(user.next!) + "pt"
        UserRank.text = "レベル" + String(user.rank!)
        //UserDays.text = "25" + "日目"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}