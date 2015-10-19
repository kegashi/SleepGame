//
//  SleepGameAPI.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/08.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import Foundation

public class SleepGameAPI {
    
    static let api: String = "http://133.27.171.211/SleepGame/api/"
    static let img: String = "http://133.27.171.211/SleepGame/img/"
    
    public class func userAPI() -> UserAPI {
        let user: UserAPI = UserAPI()
        return user
    }
    
    public class func sleepAPI() -> SleepAPI {
        let sleep: SleepAPI = SleepAPI()
        return sleep
    }
    
}