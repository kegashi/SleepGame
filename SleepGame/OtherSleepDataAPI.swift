//
//  OtherSleepData.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/11/12.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import Foundation

public class OtherSleepDataAPI {
    public struct OtherSleepData {
        public var id: String? //ID
        public var username: String? //就寝時間
        public var imgurl: String? //画像
        //public var todaypoint: Int? //今日の得点
        public var sumpoint: Int? //1週間の得点
    }
    
    public func getOtherSleepData(id: String, username: String, imgurl: String,sumpoint: Int) -> OtherSleepData{
        var mysleepdata = OtherSleepData()
        mysleepdata.id = id
        mysleepdata.username = username
        mysleepdata.imgurl = imgurl
        mysleepdata.sumpoint = sumpoint
        return mysleepdata
    }
}