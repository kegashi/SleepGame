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
    
    
    var mysleepdatas: [MySleepDataAPI.MySleepData] = []
    var arrayID = ["3J8SRD","3J8SRD","3J8SRD","3J8SRD","3J8SRD","3J8SRD","3J8SRD"]
    var arrayBed = ["20151103012300","20151104021900","20151105023200","20151106015400","20151107012400","20151108023600","20151109053200"]
    var arrayWake = ["201511030073200","201511040083600","201511050095400","201511060073100","201511070082600","201511080073900","201511090091200"]
    var arrayPoint = ["89","71","89","86","75","81","56"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let url = SleepGameAPI.api + "sample.json"
        //let json = JSON(url: url)
        //print("jsonlength")
        //print(json["0"].length)
        //let c = json["0"].length
        //let j = 1
        //print("json01id")
        //print(json["0"][String(j)]["bedtime"])
        /*
        for i in 0...c-1{
            var mysleepdata : MySleepDataAPI.MySleepData
            mysleepdata.id = String(json["0"][String(i)]["id"])
            mysleepdata.bedtime = String(json["0"][String(i)]["bedtime"])
            mysleepdata.wakeuptime = String(json["0"][String(i)]["wakeuptime"])
            mysleepdata.point = Int(String(json["0"][String(i)]["point"]))
        }
        */
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayID.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let bedtime = arrayBed[indexPath.row]
        let wakeuptime = arrayWake[indexPath.row]
        //let duration = Int(wakeuptime)! - Int(bedtime)!
        let score = arrayPoint[indexPath.row]
        
        let label0 = table.viewWithTag(1) as! UILabel
        label0.text = "11月2日(月)"
        
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
        label4.text = score + "点"
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}