//
//  AchievementViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/16.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class AchievementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    var arrayBed: [String] = []
    var arrayDay: [Int] = []
    var arrayDuration: [Int] = []
    var arrayPoint: [Int] = []
    
    //var config = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = NSUserDefaults.standardUserDefaults()
        let result : AnyObject! = config.objectForKey("UserID")
        let str: String = (result as? String)!
        print(str)
        let url = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=data"
        print("url")
        print(url)
        let json = JSON(url: url)
        print("json")
        print(json)
        print("jsonlength")
        print(json.length)
        let c = json.length
        //let j = 1
        //print("json01id")
        //print(json["0"]["0"]["username"])
        
        for(var i = 0; i < c; i++){
            arrayBed.append(String(json[String(i)]["0"]["bedtime"]))
            arrayDay.append(Int(String(json[String(i)]["0"]["day"]))!)
            arrayDuration.append(Int(String(json[String(i)]["0"]["duration"]))!)
            arrayPoint.append(Int(String(json[String(i)]["0"]["point"]))!)
        }
        
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDuration.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let bedtime = arrayBed[indexPath.row]
        print("bedtime=\(bedtime)")
        let duration = arrayDuration[indexPath.row]
        print("duration= \(duration)")
        //let waketime = Int(wakeuptime)! + Int(duration)!
        let day = arrayDay[indexPath.row]
        print("day=\(day)")
        let point = arrayPoint[indexPath.row]
        print("point=\(point)")
        let label0 = table.viewWithTag(1) as! UILabel
        label0.text = "\(bedtime)"//"11月2日(月)"
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "7:12"//"\(indexPath.row + 1)位"
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "0:54"//\(label2Array[indexPath.row])"
        
        // Tag番号 ４ で UILabel インスタンスの生成
        let label3 = table.viewWithTag(4) as! UILabel
        label3.text = "8:28"//String(duration)
        
        let label4 = table.viewWithTag(5) as! UILabel
        label4.text = "\(point)" + "点"
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}