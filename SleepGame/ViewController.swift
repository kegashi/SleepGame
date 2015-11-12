//
//  ViewController.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/08.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserID: UITextField!
    @IBOutlet weak var UserPASS: UITextField!
    @IBOutlet weak var login: UIButton!
    var config = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let config = NSUserDefaults.standardUserDefaults()
        // 設定値の取得
        let result : AnyObject! = config.objectForKey("UserID")
        let result2 : AnyObject! = config.objectForKey("UserPASS")
        UserID.text = result as? String
        UserPASS.text = result2 as? String
        UserPASS.secureTextEntry = true
        login.addTarget(self, action: "loginfunc:", forControlEvents: UIControlEvents.TouchDown)
    }
    
    //画面表示直後に呼ばれる
    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear")
        if(UserID.text != ""){
            autologinfunc()
        }
    }
    
    func loginfunc(sender: AnyObject){
        let url_String = SleepGameAPI.api + "login.php?id=" + UserID.text! + "&password=" + UserPASS.text!
        print(url_String)
        let json = JSON(url: url_String)
        if(json["login"].toString() == "true"){
            config.setObject(UserID.text ,forKey:"UserID")
            config.setObject(UserPASS.text ,forKey:"UserPASS")
            config.synchronize()
            performSegueWithIdentifier("login", sender: self)
        }else{
            print("false");
            let alert = UIAlertView()
            alert.title = "ログインエラー"
            alert.message = "IDもしくはパスワードが違います"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
    }
    
    //アプリ起動時にユーザ情報が端末に残っていた場合ログインする
    func autologinfunc(){
        let url_String = SleepGameAPI.api + "login.php?id=" + UserID.text! + "&password=" + UserPASS.text!
        print(url_String)
        let json = JSON(url: url_String)
        print(json["login"].toString() == "true")
        if(json["login"].toString() == "true"){
            performSegueWithIdentifier("login", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

