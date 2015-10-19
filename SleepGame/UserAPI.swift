//
//  UserAPI.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/08.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import Foundation

public class UserAPI {
    
    public struct User {
        public var id: String?
        public var username: String?
        public var password: String?
        public var idealduration: String?
        public var startdate: String?
        public var sumpoint: Int?
        public var picurl: String?
    }
    
    //ユーザの名前を変更する
    public func updateUserName(data: String!){
        
    }
    //ユーザのパスワードを変更する
    public func updatePassword(data: String!){
    
    }
    //ユーザの睡眠時間を変更する
    public func updateIdealduration(data: String!){
    
    }
    //ユーザの取得ポイントを変更する
    public func updateSumpoint(data: Int!){
    
    }
    //ユーザの写真を変更する
    public func updatePicurl(data: String!){
    
    }
    
    //ユーザの名前を取得する
    public func getUserName() -> String {
        return "zukky"
    }
    
    //ユーザのパスワードを取得する
    public func getPassword() -> String {
        return "zukky"
    }
    
    //ユーザの睡眠時間を取得する
    public func getUserIdealduration() -> String {
        return "0000000000000"
    }
    
    //ユーザの開始日時を取得する
    public func getStartDate() -> String{
        return "0000000000000"
    }
    
    //ユーザの取得ポイントを取得する
    public func getsumpoint() -> Int {
        return 10000
    }
    
    //ユーザの写真のURLを取得する
    public func getUserPicUrl() -> String {
        return "zukky.jpg"
    }
    //ユーザの現在のランクを取得する
    public func getRank() -> Int {
        let sumpoint: Int = 10000
        var rank: Int  = 1
        var score: Int = 0
        var flag: Bool = true
        while(flag){
            rank++
            score = rankCal(sumpoint, r: rank)
            if(score != 0){
                flag = false
            }
        }
        
        return rank - 1
    }
    
    //次のランクへの経験値を取得
    public func getNext() -> Int{
        let sumpoint: Int = 10000
        var rank: Int  = 1
        var score: Int = 0
        var flag: Bool = true
        while(flag){
            rank++
            score = rankCal(sumpoint, r: rank)
            if(score != 0){
                flag = false
            }
        }
        return score
    }
    
    //次のランクへの進捗度合い(Bar)を計算する
    public func getProg() -> Double{
        let sumpoint: Int = 10000
        var rank: Int  = 1
        var score: Int = 0
        var prescore: Int = 0
        var flag: Bool = true
        while(flag){
            rank++
            score = rankCal(sumpoint, r: rank)
            if(score != 0){
                flag = false
            }else{
                prescore = score
            }
        }
        
        return (Double(score) - Double(prescore)) / (Double())
    }
    
    //渡されたポイント(p)がそのランク(r)まであとどのくらい足りないのかを返す関数
    //達している場合は0を返す
    public func rankCal(p: Int, r: Int)-> Int {
        let num: Int = (7 * r * r + 13 * r - 20) / 2
        let difference: Int = num - p
        if difference > 0{
            return difference
        }else{
            return 0
        }
    }
}