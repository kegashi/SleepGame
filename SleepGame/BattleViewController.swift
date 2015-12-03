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
    //@IBOutlet weak var userA6: UIImageView!
    @IBOutlet weak var userB1: UIImageView!
    @IBOutlet weak var userB2: UIImageView!
    @IBOutlet weak var userB3: UIImageView!
    @IBOutlet weak var userB4: UIImageView!
    @IBOutlet weak var userB5: UIImageView!
    //@IBOutlet weak var userB6: UIImageView!
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
        print(jsonA.length)
        let jsonB = JSON(url: urlB)
        print(jsonB.length)
        var sumA = 0
        var sumB = 0
        for(var i = 0;i < jsonA.length;i++){
            if(i < 5){
            imgUrls.append(String(jsonA[String(i)]["0"]["imgurl"]))
            }
            sumA+=(Int(String(jsonA[String(i)]["0"]["pointweek"]))!)
        }
        self.sumA.text = "\(sumA)pt"

        for(var i = 0;i < jsonB.length;i++){
            if(i < 5){
                imgUrls.append(String(jsonB[String(i)]["0"]["imgurl"]))
            }
            sumB+=(Int(String(jsonB[String(i)]["0"]["pointweek"]))!)
        }
        self.sumB.text = "\(sumB)pt"
        print(imgUrls)
        imgOutput()

    }
    
    func imgOutput(){
        userA1.image = img(imgUrls[0]) //UIImage(named:imgUrls[0])
        userA2.image = img(imgUrls[1]) //UIImage(named:imgUrls[1])
        userA3.image = img(imgUrls[2]) //UIImage(named:imgUrls[2])
        userA4.image = img(imgUrls[3]) //UIImage(named:imgUrls[3])
        userA5.image = img(imgUrls[4]) //UIImage(named:imgUrls[4])
        userB1.image = img(imgUrls[5]) //UIImage(named:imgUrls[5])
        userB2.image = img(imgUrls[6]) //UIImage(named:imgUrls[6])
        userB3.image = img(imgUrls[7]) //UIImage(named:imgUrls[7])
        userB4.image = img(imgUrls[8]) //UIImage(named:imgUrls[8])
        userB5.image = img(imgUrls[9]) //UIImage(named:imgUrls[9])
    }
    
    func img(str: String)->UIImage{
        let imgurl = SleepGameAPI.img + str
        let url = NSURL(string: imgurl)
        var imgData: NSData
        do {
            imgData = try NSData(contentsOfURL:url!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let img = UIImage(data:imgData);
            return img!
        } catch {
            print("Error: can't create image.")
            return UIImage(named:"Icon.png")!
        }
    }
}