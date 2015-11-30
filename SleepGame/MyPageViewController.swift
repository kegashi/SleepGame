//
//  MyPageViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/16.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var UIdate: UILabel!
    @IBOutlet weak var UIduration: UILabel!
    @IBOutlet weak var UIbedtime: UILabel!
    @IBOutlet weak var UIwaketime: UILabel!
    @IBOutlet weak var UIidealduration: UILabel!
    @IBOutlet weak var UIidealbedtime: UILabel!
    @IBOutlet weak var UIidealwaketime: UILabel!
    @IBOutlet weak var UIquantity: UILabel!
    @IBOutlet weak var UIquality: UILabel!
    @IBOutlet weak var UIrhythm: UILabel!
    @IBOutlet weak var UIscore: UILabel!
    @IBOutlet weak var UIcomment: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let config = NSUserDefaults.standardUserDefaults()
        let result : AnyObject! = config.objectForKey("UserID")
        let str: String = (result as? String)!
        print(str)
        let url = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=data"
        print("url")
        print(url)
        let json = JSON(url: url)
        let url_user = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=false"
        let json_user = JSON(url: url_user)
        print(json_user)
        
        if(json[String(0)]["0"].length == 0){
        }else{
            let bedtime = String(json[String(0)]["0"]["bedtime"])
            let dayNum = Int(String(json[String(0)]["0"]["day"]))!
            let duration = Int(String(json[String(0)]["0"]["duration"]))!
            let point = Int(String(json[String(0)]["0"]["point"]))!
            let quantity = Int(String(json[String(0)]["0"]["quantity"]))!
            let quality = Int(String(json[String(0)]["0"]["quality"]))!
            let rhythmpoint = Int(String(json[String(0)]["0"]["rhythmpoint"]))!
            let idealduration = Int(String(json_user[String(0)]["0"]["idealduration"]))!
            let idealbedtime = String(json_user[String(0)]["0"]["idealbedtime"])
            
            let formatter: NSDateFormatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let bedtime2:NSDate = formatter.dateFromString(bedtime)!
            var dateUnix: NSTimeInterval? = bedtime2.timeIntervalSince1970
            dateUnix = dateUnix! + NSTimeInterval(duration*60)
            let waketime = NSDate(timeIntervalSince1970: dateUnix!)
            
            let idealbedtime2:NSDate = formatter.dateFromString(idealbedtime)!
            var idealdateUnix: NSTimeInterval? = idealbedtime2.timeIntervalSince1970
            idealdateUnix = idealdateUnix! + NSTimeInterval(idealduration*60)
            let idealwaketime = NSDate(timeIntervalSince1970: idealdateUnix!)
            
            //曜日
            let formatter_day: NSDateFormatter = NSDateFormatter()
            let day = formatter_day.shortWeekdaySymbols[dayNum]
            
            UIdate.text = "\(waketime.month)月\(waketime.day)日(\(day))"
            UIduration.text = "\(duration/60)時間\(NSString(format: "%02d", duration%60))分"
            UIidealduration.text = "\(idealduration/60)時間\(idealduration%60)分"
            UIidealbedtime.text = "\(idealbedtime2.hour):\(NSString(format: "%02d", idealbedtime2.minute))"
            UIidealwaketime.text = "\(idealwaketime.hour):\(NSString(format: "%02d", idealwaketime.minute))"
            UIbedtime.text = "\(bedtime2.hour):\(NSString(format: "%02d", bedtime2.minute))"
            UIwaketime.text = "\(waketime.hour):\(NSString(format: "%02d", waketime.minute))"
            UIquantity.text = "\(quantity)点"
            UIquality.text = "\(quality)点"
            UIrhythm.text = "\(rhythmpoint)点"
            UIscore.text = "\(point)"
            UIcomment.text = comment(point)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //スコア0~100を渡すとコメントを返す
    func comment(score: Int)->String{
        if(score >= 90){ return "素晴らしい睡眠！文句のないハイスコアですね！キープしましょう。" }
        else if(score >= 80){ return "高得点！この調子で頑張っていけばQOLが上がるでしょう！" }
        else if(score >= 60){ return "もうちょっと。まずは80点を目指して見てましょう。" }
        else if(score >= 40){ return "まだまだ改善できます。就寝時間を逆算して意識しましょう。" }
        else{ return "かなり低い....まずは計算方法についてを見て、知識をつけよう。" }
    }
    
    @IBAction func unwindToMyPage(segue: UIStoryboardSegue) {
    }
}
