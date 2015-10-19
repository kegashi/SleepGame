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
    @IBOutlet weak var UserDays: UILabel!
    @IBOutlet weak var UserExp: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //ユーザの画像の読み込み
        let img_url = SleepGameAPI.img + SleepGameAPI.userAPI().getUserPicUrl()
        let url = NSURL(string: img_url);
        let imgData: NSData
        do {
            imgData = try NSData(contentsOfURL:url!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let img = UIImage(data:imgData);
            UserImg.image = img
        } catch {
            print("Error: can't create image.")

        }
        UserName.text = SleepGameAPI.userAPI().getUserName()
        
        UserBar.progress = 0.9
        UserExp.text = "次:" + String(SleepGameAPI.userAPI().getNext()) + "pt"
        UserRank.text = "ランク" + String(SleepGameAPI.userAPI().getRank())
        UserDays.text = "10" + "日目"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}