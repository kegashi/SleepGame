//
//  BattleViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/11/16.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    
    var imgUrls: [String] = []
    var UserImg: [UIImageView] = []
    @IBOutlet weak var userA1: UIImageView!
    @IBOutlet weak var userA2: UIImageView!
    @IBOutlet weak var userA3: UIImageView!
    @IBOutlet weak var userA4: UIImageView!
    @IBOutlet weak var userA5: UIImageView!
    @IBOutlet weak var userA6: UIImageView!
    @IBOutlet weak var userB1: UIImageView!
    @IBOutlet weak var userB2: UIImageView!
    @IBOutlet weak var userB3: UIImageView!
    @IBOutlet weak var userB4: UIImageView!
    @IBOutlet weak var userB5: UIImageView!
    @IBOutlet weak var userB6: UIImageView!
    @IBOutlet weak var sumA: UILabel!
    @IBOutlet weak var sumB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = NSUserDefaults.standardUserDefaults()
        let result : AnyObject! = config.objectForKey("UserID")
        let str: String = (result as? String)!
        print(str)
        let urlA = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=dataA"
        let urlB = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=dataB"
        let jsonA = JSON(url: urlA)
        let jsonB = JSON(url: urlB)
        var sumA = 0
        var sumB = 0
        for(var i = 0;i < jsonA.length;i++){
            if(i < 6){
            imgUrls.append(String(jsonA[String(i)]["0"]["imgurl"]))
            }
            sumA+=(Int(String(jsonA[String(i)]["0"]["pointweek"]))!)
        }
        self.sumA.text = "\(sumA)pt"

        for(var i = 0;i < jsonB.length;i++){
            if(i < 6){
                imgUrls.append(String(jsonB[String(i)]["0"]["imgurl"]))
            }
            sumB+=(Int(String(jsonB[String(i)]["0"]["pointweek"]))!)
        }
        self.sumB.text = "\(sumB)pt"
        imgOutput()

    }
    
    func imgOutput(){
        userA1.image = UIImage(data:imgUrls[0].dataUsingEncoding(NSUTF8StringEncoding)!)
        userA2.image = UIImage(data:imgUrls[1].dataUsingEncoding(NSUTF8StringEncoding)!)
        userA3.image = UIImage(data:imgUrls[2].dataUsingEncoding(NSUTF8StringEncoding)!)
        userA4.image = UIImage(data:imgUrls[3].dataUsingEncoding(NSUTF8StringEncoding)!)
        userA5.image = UIImage(data:imgUrls[4].dataUsingEncoding(NSUTF8StringEncoding)!)
        userA6.image = UIImage(data:imgUrls[5].dataUsingEncoding(NSUTF8StringEncoding)!)
        userB1.image = UIImage(data:imgUrls[6].dataUsingEncoding(NSUTF8StringEncoding)!)
        userB2.image = UIImage(data:imgUrls[7].dataUsingEncoding(NSUTF8StringEncoding)!)
        userB3.image = UIImage(data:imgUrls[8].dataUsingEncoding(NSUTF8StringEncoding)!)
        userB4.image = UIImage(data:imgUrls[9].dataUsingEncoding(NSUTF8StringEncoding)!)
        userB5.image = UIImage(data:imgUrls[10].dataUsingEncoding(NSUTF8StringEncoding)!)
        userB6.image = UIImage(data:imgUrls[11].dataUsingEncoding(NSUTF8StringEncoding)!)
        /*
        var url = NSURL(string: img_url)
        var imgData: NSData
        do {
            imgData = try NSData(contentsOfURL:url!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let img = UIImage(data:imgData);
            userA1.image = img
        } catch {
            print("Error: can't create image.")
            
        }
        */
    }
}