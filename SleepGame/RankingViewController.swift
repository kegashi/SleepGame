//
//  RankingViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/16.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    var imgArray: [String] = []
    
    var sumpoint: [Int] = []
    
    var username: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = NSUserDefaults.standardUserDefaults()
        let result : AnyObject! = config.objectForKey("UserID")
        let str: String = (result as? String)!
        print(str)
        let url = SleepGameAPI.api + "getmydata.php?id=" + (result as? String)! + "&all=true"
        let json = JSON(url: url)
        print("json")
        print(json)
        print("jsonlength")
        print(json.length)
        print(json["0"]["0"]["username"])
        
        for(var i = 0;i < json.length;i++){
            //print(value)
            //username.append(String(json["0"]["0"]["username"])
            //String(json["0"]["0"]["id"])
            imgArray.append(String(json[String(i)]["0"]["imgurl"]))
            sumpoint.append(Int(String(json[String(i)]["0"]["pointweek"]))!)
            
            username.append(String(json[String(i)]["0"]["username"]))
            
        }
        print(imgArray.count)
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let img_url = SleepGameAPI.img + imgArray[indexPath.row]
        let url = NSURL(string: img_url)
        let imgData: NSData
        do {
            imgData = try NSData(contentsOfURL:url!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let img = UIImage(data:imgData);
            //let img = UIImage(named:"\(imgArray[indexPath.row])")
            // Tag番号 1 で UIImageView インスタンスの生成
            let imageView = table.viewWithTag(1) as! UIImageView
            imageView.image = img
        } catch {
            print("Error: can't create image.")
            
        }
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "\(username[indexPath.row])"//\(indexPath.row + 1)位"
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "\(sumpoint[indexPath.row])pt"
        
        // Tag番号 ４ で UILabel インスタンスの生成
        let label3 = table.viewWithTag(4) as! UILabel
        label3.text = "\(indexPath.row + 1)位"
        
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

    
/*
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var tri1: UIImageView!
    @IBOutlet weak var tri2: UIImageView!
    
    var productList = [
        CTModel(tablePic:"zukky.jpg",tableName:"zukky",tablePoint:"400",tableRank:"1"),
        CTModel(tablePic:"zukky.jpg",tableName:"suigen",tablePoint:"350",tableRank:"2"),
        CTModel(tablePic:"zukky.jpg",tableName:"fabius",tablePoint:"300",tableRank:"3"),
        CTModel(tablePic:"zukky.jpg",tableName:"isokichi",tablePoint:"200",tableRank:"4"),
        CTModel(tablePic:"zukky.jpg",tableName:"wataru",tablePoint:"100",tableRank:"5"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tri1.hidden = true
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Viewcell")
        table.delegate = self
        table.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("RankingView-tableView")
        let a: Int = 5
        return a
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("RankingView-tableView2")
        // tableCell の ID で UITableViewCell のインスタンスを生成

        let cell: CTViewCell = self.table.dequeueReusableCellWithIdentifier("Viewcell") as! CTViewCell
        print("RankingView-tableView2-mid")
        cell.configureCell(productList[indexPath.row], atIndexPath : indexPath)
        print("RankingView-tableView2-fin")
        return cell
    }
    
}
*/
