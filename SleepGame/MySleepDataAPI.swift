//
//  SleepDataAPI.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/11/09.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import Foundation

public class MySleepDataAPI {
    
    public struct MySleepData {
        public var id: String? //ID
        public var bedtime: String? //就寝時間
        public var duration: Int? //起床時間
        public var point: Int? //得点
    }
    /*
    public func getMysleepData(id: String, wakeuptime: String, point:Int) -> MySleepData{
        var mysleepdata = MySleepData()
        ///mysleepdata.id = id
        //mysleepdata.bedtime = bedtime
        //mysleepdata.wakeuptime = wakeuptime
        //mysleepdata.point = point
        return mysleepdata
    }
    */
}