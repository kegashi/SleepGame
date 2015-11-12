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
    let imgArray: NSArray = ["zukky.jpg","zukky.jpg","zukky.jpg","zukky.jpg",
        "zukky.jpg","zukky.jpg","zukky.jpg","zukky.jpg"]
    
    let label2Array: NSArray = ["2013/8/23/16:04","2013/8/23/16:15","2013/8/23/16:47","2013/8/23/17:10",
        "2013/8/23/1715:","2013/8/23/17:21","2013/8/23/17:33","2013/8/23/17:41"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let img = UIImage(named:"\(imgArray[indexPath.row])")
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = "zukky"//"\(indexPath.row + 1)位"
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = "300pt"//\(label2Array[indexPath.row])"
        
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
