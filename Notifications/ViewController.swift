//
//  ViewController.swift
//  Notifications
//
//  Created by kiiita on 2014/08/09.
//  Copyright (c) 2014年 Yuto Kitakuni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"popUpText:", name: "actionOnePressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAMessage:", name: "actionTwoPressed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"showAText:", name: "actionThreePressed", object: nil)
        
        
        // Noticeを出す日時の設定
        var dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = 2014;
        dateComp.month = 06;
        dateComp.day = 09;
        dateComp.hour = 15;
        dateComp.minute = 26;
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        
        var calender:NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        var date:NSDate = calender.dateFromComponents(dateComp)
        
        
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "Hello, World!"
        // notification.fireDate = date
        // 30秒後にNoticeを出したいとき
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
    
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    
    func popUpText(notification:NSNotification){
        // frame:GGRectMake(left, top, width, height)
        var newLabel:UILabel = UILabel(frame:CGRectMake(0, 30, 320, 100))
        
        // 表示するアイテム
        newLabel.text = "Action Aを選んだね"
        newLabel.textColor = UIColor.whiteColor()
        newLabel.backgroundColor = UIColor(red: 0.20, green: 0.67, blue: 0.86, alpha: 1.0);
        
        self.view.addSubview(newLabel)
        
    }
    
    func showAMessage(notification:NSNotification){
        var message:UIAlertController = UIAlertController(title: "Action Bを選んだね！", message: "おほほほほ", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "閉じる", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
        
    }
    
    func showAText(notification:NSNotification){
        var newLabel:UILabel = UILabel(frame:CGRectMake(0, 100, 320, 100))
        newLabel.text = "Action Cを選んだね!!"
        newLabel.textColor = UIColor(red: 0.20, green: 0.67, blue: 0.86, alpha: 1.0);
        
        self.view.addSubview(newLabel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
