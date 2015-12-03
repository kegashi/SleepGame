//
//  ConfigViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/16.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    @IBOutlet weak var bedtime: UIDatePicker!
    @IBOutlet weak var waketime: UIDatePicker!
    @IBOutlet weak var addtime: UIDatePicker!
    @IBOutlet weak var updateGoal: UIButton!
    @IBOutlet weak var logout: UIButton!
    var config = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.]
        logout.addTarget(self, action: "logoutfunc:", forControlEvents: UIControlEvents.TouchDown)
        updateGoal.addTarget(self, action: "update:", forControlEvents: UIControlEvents.TouchDown)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ログアウトする
    func logoutfunc(sender: AnyObject){
        config.setObject("" ,forKey:"UserID")
        config.setObject("" ,forKey:"UserPASS")
        config.synchronize()
        performSegueWithIdentifier("logout", sender: self)
    }
    
    //目標を変更ボタンをおした時に呼ばれる
    func update(sender: AnyObject){
        let userid : AnyObject! = config.objectForKey("UserID")
        let bedtime: NSDate = self.bedtime.date
        let waketime: NSDate = self.waketime.date
        let addtime: NSDate = self.addtime.date
        
        var idealduration = abs((waketime.hour - bedtime.hour) * 60 + (waketime.minute - bedtime.minute))
        if(idealduration > 720){
            idealduration = 1440 - idealduration
        }
        idealduration = idealduration + addtime.hour*60 + addtime.minute
        var idealUnix: NSTimeInterval? = waketime.timeIntervalSince1970
        
        idealUnix = idealUnix! - NSTimeInterval(idealduration*60)
        let idealbedtime = NSDate(timeIntervalSince1970: idealUnix!)
        let idealbedtimeStr: String = "20000101\(NSString(format: "%02d", idealbedtime.hour))\(NSString(format: "%02d", idealbedtime.minute))00"
        let url = SleepGameAPI.api + "changeideal.php?id=" + (userid as? String)! + "&idealduration=\(idealduration)&idealbedtime=" + idealbedtimeStr
        let json = JSON(url: url)
        if(json["result"].toString() == "true"){
            let alert = UIAlertView()
            alert.title = "変更完了"
            alert.message = "目標時間を\(idealbedtime.hour):\(NSString(format: "%02d",idealbedtime.minute))~\(waketime.hour):\(NSString(format: "%02d",waketime.minute))に変更しました！頑張りましょう！"
            alert.addButtonWithTitle("OK")
            alert.show()
            performSegueWithIdentifier("refresh", sender: self)
        }
    }
}