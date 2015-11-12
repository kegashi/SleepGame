//
//  CTModel.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/23.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class CTModel: NSObject {
    
    var tablePic:NSString //画像URL
    var tableName:NSString //名前
    var tablePoint:NSString //ポイント
    var tableRank:NSString //順位
    
    // initialize
    init(tablePic: String, tableName:String, tablePoint:String, tableRank:String) {
        print("CTModel-init")
        self.tablePic = tablePic
        self.tableName = tableName
        print(tableName)
        self.tablePoint = tablePoint
        self.tableRank = tableRank
    }
}
