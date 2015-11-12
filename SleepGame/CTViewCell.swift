//
//  CTViewCell.swift
//  SleepGame
//
//  Created by 江頭 和輝 on 2015/10/23.
//  Copyright © 2015年 Kazuki Egashira. All rights reserved.
//

import UIKit

class CTViewCell: UITableViewCell {
    
    //    required init(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }

    @IBOutlet weak var tablePic: UIImageView!
    @IBOutlet weak var tableName: UILabel!
    @IBOutlet weak var tablePoint: UILabel!
    @IBOutlet weak var tableRank: UILabel!
    

    
    //Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        print("CTViewCell-configureCell")
        //titleLabel.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.8)
        //categoryName.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.8)
        
    }
    
    // セル内セット
    func configureCell(texts:CTModel, atIndexPath indexPath: NSIndexPath){
        print("CTViewCell-configureCell")
        tablePic.image = UIImage(contentsOfFile: texts.tablePic as String)
        tableName.text = texts.tableName as String
        tablePoint.text = texts.tablePoint as String
        tableRank.text = texts.tableRank as String
    }
    
}
