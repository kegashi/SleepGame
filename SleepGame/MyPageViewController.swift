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
    //@IBOutlet weak var UIreload: UIButton!
    
    let config = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UIreload.addTarget(self, action: "reloadfunc:", forControlEvents: UIControlEvents.TouchDown)
        let result : AnyObject! = config.objectForKey("UserID")
        var lastrecord : AnyObject! = config.objectForKey("LastRecord")
        
        if(lastrecord == nil){
            config.setObject(NSDate(timeIntervalSince1970: 0) ,forKey:"LastRecord")
            lastrecord = config.objectForKey("LastRecord")
        }
        
        let str: String = (result as? String)!
        print(str)
        let url = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=data"
        print("url")
        print(url)
        let json = JSON(url: url)
        let url_user = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=false"
        let json_user = JSON(url: url_user)
        print(json_user)
        
        
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let idealduration = Int(String(json_user[String(0)]["0"]["idealduration"]))!
        let idealbedtime = String(json_user[String(0)]["0"]["idealbedtime"])
        let idealbedtime2:NSDate = formatter.dateFromString(idealbedtime)!
        var idealdateUnix: NSTimeInterval? = idealbedtime2.timeIntervalSince1970
        idealdateUnix = idealdateUnix! + NSTimeInterval(idealduration*60)
        let idealwaketime = NSDate(timeIntervalSince1970: idealdateUnix!)
        UIidealduration.text = "\(idealduration/60)時間\(NSString(format: "%02d",idealduration%60))分"
        UIidealbedtime.text = "\(idealbedtime2.hour):\(NSString(format: "%02d", idealbedtime2.minute))"
        UIidealwaketime.text = "\(idealwaketime.hour):\(NSString(format: "%02d", idealwaketime.minute))"
        
        if(json[String(0)]["0"].length == 0){
        }else{
            
            //jsonから受け取ったデータを整える
            let bedtime = String(json[String(0)]["0"]["bedtime"])
            let dayNum = Int(String(json[String(0)]["0"]["day"]))!
            let duration = Int(String(json[String(0)]["0"]["duration"]))!
            let point = Int(String(json[String(0)]["0"]["point"]))!
            let quantity = Int(String(json[String(0)]["0"]["quantity"]))!
            let quality = Int(String(json[String(0)]["0"]["quality"]))!
            let rhythmpoint = Int(String(json[String(0)]["0"]["rhythmpoint"]))!
            
            let bedtime2:NSDate = formatter.dateFromString(bedtime)!
            var dateUnix: NSTimeInterval? = bedtime2.timeIntervalSince1970
            dateUnix = dateUnix! + NSTimeInterval(duration*60)
            let waketime = NSDate(timeIntervalSince1970: dateUnix!)
            
            //曜日
            let formatter_day: NSDateFormatter = NSDateFormatter()
            let day = formatter_day.shortWeekdaySymbols[dayNum]
            
            //今日始めてのログインだったら質問する
            print(NSDate().day)
            if(waketime.day != (lastrecord as? NSDate)!.day){
                config.setObject(waketime ,forKey:"LastRecord")
                question(point, quantity: quantity, quality: quality, rhythmpoint: rhythmpoint)
            }else{
                    viewScore(point, quantity: quantity, quality: quality, rhythmpoint: rhythmpoint)
            }
            //値を入れる
            UIdate.text = "\(waketime.month)月\(waketime.day)日(\(day))"
            UIduration.text = "\(duration/60)時間\(NSString(format: "%02d", duration%60))分"
            UIbedtime.text = "\(bedtime2.hour):\(NSString(format: "%02d", bedtime2.minute))"
            UIwaketime.text = "\(waketime.hour):\(NSString(format: "%02d", waketime.minute))"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //スコアを表示
    func viewScore(score: Int, quantity: Int, quality: Int, rhythmpoint: Int){
        UIquantity.text = "\(quantity)点"
        UIquality.text = "\(quality)点"
        UIrhythm.text = "\(rhythmpoint)点"
        UIscore.text = "\(score)"
        UIcomment.text = comment(score)
    }
    
    //スコア0~100を渡すとコメントを返す
    func comment(score: Int)->String{
        if(score >= 90){ return "素晴らしい睡眠！文句のないハイスコアですね！キープしましょう。" }
        else if(score >= 80){ return "高得点！この調子で頑張っていけばQOLが上がるでしょう！" }
        else if(score >= 60){ return "もうちょっと。80点を目指して見てましょう。" }
        else if(score >= 40){ return "まだまだ改善できます。就寝時間を逆算して意識しましょう。" }
        else{ return "かなり低い....まずは計算方法についてを見て、知識をつけよう。" }
    }
    
    //アンケートに答えてもらうヤツ
    func question(score: Int, quantity: Int, quality: Int, rhythmpoint: Int){
        
        let alert = UIAlertController(title: "本日の睡眠は？", message: "本日の睡眠を0~100で自己採点してください！", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {
            action in
            self.todayScore(score, quantity: quantity, quality: quality, rhythmpoint: rhythmpoint, selfscore: alert.textFields![0].text!)
        })
        
        alert.addAction(action)
        alert.addTextFieldWithConfigurationHandler({
            textField in textField.keyboardType = .NumberPad
        })
        presentViewController(alert, animated: true, completion: nil)
        let lastlogin: NSDate = NSDate()
    }
    
    //今日の点数をアラートする
    func todayScore(score: Int, quantity: Int, quality: Int, rhythmpoint: Int, selfscore: String){

        //自己採点した点数をサーバに送るモジュールを作る必要がある！
        let lastrecord : AnyObject! = config.objectForKey("LastRecord")
        let date: NSDate = (lastrecord as? NSDate)!
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        let dateStr: String = formatter.stringFromDate(date)
        
        let userid : AnyObject! = config.objectForKey("UserID")
        let url = SleepGameAPI.api + "questionaire.php?id=" + (userid as? String)! + "&selfpoint=" + selfscore + "&quantity=\(quantity)&quality=\(quality)&rhythmpoint=\(rhythmpoint)&quantity=\(quantity)&point=\(score)&date=" + dateStr
        print(url)
        let json = JSON(url: url)
        if(json["result"].toString() != "true"){
            let alert = UIAlertView()
            alert.title = "送信に失敗しました"
            alert.message = "アプリ開発者にご連絡ください。"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        viewScore(score, quantity: quantity, quality: quality, rhythmpoint: rhythmpoint)
        let alert = UIAlertView()
        alert.title = "本日の点数は\(score)点です"
        alert.message = "睡眠時間:\(quantity)点\n睡眠時間:\(quality)点\n睡眠時間:\(rhythmpoint)点\n\(comment(score))\nこのアプリではあなたの睡眠に以上の評価をつけました。"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    /*
    func reloadfunc(sender: AnyObject){
        performSegueWithIdentifier("reload", sender: self)
    }
    */
    
    @IBAction func unwindToMyPage(segue: UIStoryboardSegue) {
        
    }
}
