//
//  GDAddTimeView.swift
//  POCPickDateAddTime
//
//  Created by Liu Jingkai on 16/6/29.
//  Copyright © 2016年 Liu Jingkai. All rights reserved.
//

import UIKit
import SnapKit
import pop


class GDAddTimeView: UIView {

    var isCountTime = false
    
    let viewBackgroundColor = UIColor.darkGrayColor()
    
    // The timer button is to start and stop time counter
    let timerButton = UIButton()
    let timerButtonColor = UIColor.blueColor()
    
    
    let totalTimeButton = UIButton()
    let totalTimeButtonColor = UIColor.grayColor()

    // Add Time button [1, 5, 10, 15, 25, 35, 45, 60], 8 items
    var addTimeButtons = [UIButton]()
    let addTimeButtonsColor = UIColor.darkGrayColor()
    
    //addTimeArray record the summary time, when the user click addTimeButtons
    var addTimeArray: [Int] = [0]

    override func drawRect(rect: CGRect) {
        
        self.backgroundColor = viewBackgroundColor
        
        // Add timerButton
        timerButton.backgroundColor = timerButtonColor
        timerButton.addTarget(self, action: #selector(GDAddTimeView.recordTime(_:)), forControlEvents: .TouchUpInside)
        self.addSubview(timerButton)
        
        timerButton.snp_makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add totalTimeButton
        totalTimeButton.backgroundColor = totalTimeButtonColor
        totalTimeButton.layer.cornerRadius = self.bounds.height/6
        totalTimeButton.setTitle("0", forState: .Normal)
        totalTimeButton.titleLabel?.font = UIFont.systemFontOfSize(33)
        totalTimeButton.addTarget(self, action: #selector(GDAddTimeView.minusTime(_:)), forControlEvents: .TouchUpInside)
        self.addSubview(totalTimeButton)
        
        totalTimeButton.snp_makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(CGSizeMake(self.bounds.height/3, self.bounds.width/3))
        }
        
        // Add a label vuew as subview in totalTimeButton
        let minLable = UILabel()
        minLable.text = "min"
        minLable.textColor = UIColor.whiteColor()
        minLable.font = UIFont.systemFontOfSize(16)
        totalTimeButton.addSubview(minLable)
        
        minLable.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(-10)
        }
        
        // Initial addTimeButtons
        for i in 0...7 {
            let addTimeButton = UIButton()
            addTimeButtons.append(addTimeButton)
            addTimeButtons[i].backgroundColor = addTimeButtonsColor
            addTimeButtons[i].layer.cornerRadius = self.bounds.height/20
            addTimeButtons[i].addTarget(self, action: #selector(GDAddTimeView.addTime(_:)), forControlEvents: .TouchUpInside)
        }
        
        // Add the 1st button: 1 min
        addTimeButtons[0].setTitle("1", forState: .Normal)
        self.addSubview(addTimeButtons[0])
        
        addTimeButtons[0].snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(-self.bounds.height/3)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 2nd button: 5 min
        addTimeButtons[1].setTitle("5", forState: .Normal)
        self.addSubview(addTimeButtons[1])
        
        addTimeButtons[1].snp_makeConstraints { (make) in
            let parameterA = self.bounds.height/(3*sqrt(2))
            make.centerX.equalTo(parameterA)
            make.centerY.equalTo(-parameterA)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        
        // Add the 3rd button: 10 min
        addTimeButtons[2].setTitle("10", forState: .Normal)
        self.addSubview(addTimeButtons[2])
        
        addTimeButtons[2].snp_makeConstraints { (make) in
            make.centerX.equalTo(self.bounds.width/3)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 4th button: 15 min
        addTimeButtons[3].setTitle("15", forState: .Normal)
        self.addSubview(addTimeButtons[3])
        
        addTimeButtons[3].snp_makeConstraints { (make) in
            let parameterA = self.bounds.height/(3*sqrt(2))
            make.centerX.equalTo(parameterA)
            make.centerY.equalTo(parameterA)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 5th button: 25 min
        addTimeButtons[4].setTitle("25", forState: .Normal)
        self.addSubview(addTimeButtons[4])
        
        addTimeButtons[4].snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.bounds.height/3)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }

        // Add the 6th button: 35 min
        addTimeButtons[5].setTitle("35", forState: .Normal)
        self.addSubview(addTimeButtons[5])
        
        addTimeButtons[5].snp_makeConstraints { (make) in
            let parameterA = self.bounds.height/(3*sqrt(2))
            make.centerX.equalTo(-parameterA)
            make.centerY.equalTo(parameterA)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 7th button: 45 min
        addTimeButtons[6].setTitle("45", forState: .Normal)
        self.addSubview(addTimeButtons[6])
        
        addTimeButtons[6].snp_makeConstraints { (make) in
            make.centerX.equalTo(-self.bounds.width/3)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 8th button: 60 min
        addTimeButtons[7].setTitle("60", forState: .Normal)
        self.addSubview(addTimeButtons[7])
        
        addTimeButtons[7].snp_makeConstraints { (make) in
            let parameterA = self.bounds.height/(3*sqrt(2))
            make.centerX.equalTo(-parameterA)
            make.centerY.equalTo(-parameterA)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
    }

    // When the user click timerButton, will call recordTime function
    func recordTime(sender:AnyObject){
        print("Clicked record time button")
        
        if isCountTime {
            
            // Current status is count the time, switch to normal state
            isCountTime = false
            
            // Scale Time Buttons size to zero
            let alphaTimeButtons = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
            alphaTimeButtons.toValue = 1
            
            let numberOfAddTimeButton = addTimeButtons.count
            
            for i in 0...(numberOfAddTimeButton-1) {
                self.addTimeButtons[i].pop_addAnimation(alphaTimeButtons, forKey: "alphaTimeButtons")
                self.addTimeButtons[i].userInteractionEnabled = true
            }
            
            /* ---ToDo Refactory---*/
            // Scale Total time button size to 1X
            let scaleTobiggerTotalTimeButton = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            scaleTobiggerTotalTimeButton.toValue = NSValue(CGSize: CGSizeMake(1, 1))
            scaleTobiggerTotalTimeButton.springBounciness = 20
            scaleTobiggerTotalTimeButton.springSpeed = 20
            
            self.totalTimeButton.userInteractionEnabled = true
            self.totalTimeButton.pop_addAnimation(scaleTobiggerTotalTimeButton, forKey: "scaleTobigerTotalTimeButton")
            
        } else {
            
            // Current status is the normal state, switch to count time state
            isCountTime = true
            
            // Scale Time Buttons size to zero
            let alphaTimeButtons = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
            alphaTimeButtons.toValue = NSValue(CGSize: CGSizeMake(0, 0))
            let numberOfAddTimeButton = addTimeButtons.count
            
            for i in 0...(numberOfAddTimeButton-1) {
                self.addTimeButtons[i].pop_addAnimation(alphaTimeButtons, forKey: "alphaTimeButtons")
                self.addTimeButtons[i].userInteractionEnabled = false
            }
            
            /* ---ToDo Refactory---*/
            // Scale Total time button size to 1.5X
            let scaleTobiggerTotalTimeButton = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            scaleTobiggerTotalTimeButton.toValue = NSValue(CGSize: CGSizeMake(1.5, 1.5))
            scaleTobiggerTotalTimeButton.springBounciness = 20
            scaleTobiggerTotalTimeButton.springSpeed = 20
            
            self.totalTimeButton.userInteractionEnabled = false
            self.totalTimeButton.pop_addAnimation(scaleTobiggerTotalTimeButton, forKey: "scaleTobigerTotalTimeButton")
        }
    }

    func addTime(sender: UIButton) {
        
        print("The button \(sender.titleLabel?.text) was clicked!")
        
        let addTimeToArray = Int((sender.titleLabel?.text)!)
        
        self.addTimeArray.append(addTimeToArray!)
        
        var addTotalTime = 0
        
        for i in addTimeArray{
            addTotalTime += i
        }
        
        self.totalTimeButton.setTitle("\(addTotalTime)", forState: .Normal)
        
        if addTotalTime < 30{
            self.totalTimeButton.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        }else if addTotalTime >= 30 && addTotalTime <= 60{
            self.totalTimeButton.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
        }else{
            self.totalTimeButton.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
        }
        
        /* ---ToDo Refactory---*/
        // Scale total time button size based on sum of total time
        let scaleTobiggerTotalTimeButton = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        
        var scaleX: CGFloat
        var scaleY: CGFloat
        if addTotalTime <= 120 {
            scaleX = CGFloat(1.0 + Double(addTotalTime)/360.0)
            scaleY = CGFloat(1.0 + Double(addTotalTime)/360.0)
        } else if addTotalTime <= 600 {
            scaleX = CGFloat(1.33 + Double(addTotalTime)/6000)
            scaleY = CGFloat(1.33 + Double(addTotalTime)/6000)
        } else {
            scaleX = CGFloat(1.45)
            scaleY = CGFloat(1.45)
        }
        
        scaleTobiggerTotalTimeButton.toValue = NSValue(CGSize: CGSizeMake(scaleX, scaleY))
        scaleTobiggerTotalTimeButton.springBounciness = 20
        scaleTobiggerTotalTimeButton.springSpeed = 20
        self.totalTimeButton.pop_addAnimation(scaleTobiggerTotalTimeButton, forKey: "scaleTobigerTotalTimeButton")
    }
    
    func minusTime(sender: UIButton) {
        
        if addTimeArray.count != 0 {
            
            addTimeArray.removeLast()
            
            var addTotalTime = 0
            for i in addTimeArray{
                addTotalTime += i
            }
            
            self.totalTimeButton.setTitle("\(addTotalTime)", forState: .Normal)

            if addTotalTime == 0 {
                self.totalTimeButton.backgroundColor = totalTimeButtonColor
            } else if (addTotalTime > 0 && addTotalTime < 30) {
                self.totalTimeButton.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
            } else if (addTotalTime >= 30 && addTotalTime <= 60) {
                self.totalTimeButton.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
            } else {
                self.totalTimeButton.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
            }
            
            /* ---ToDo Refactory---*/
            // Scale total time button size based on sum of total time
            let scaleTobiggerTotalTimeButton = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
            
            var scaleX: CGFloat
            var scaleY: CGFloat
            if addTotalTime <= 120 {
                scaleX = CGFloat(1.0 + Double(addTotalTime)/360.0)
                scaleY = CGFloat(1.0 + Double(addTotalTime)/360.0)
            } else if addTotalTime <= 600 {
                scaleX = CGFloat(1.33 + Double(addTotalTime)/6000)
                scaleY = CGFloat(1.33 + Double(addTotalTime)/6000)
            } else {
                scaleX = CGFloat(1.45)
                scaleY = CGFloat(1.45)
            }
            
            scaleTobiggerTotalTimeButton.toValue = NSValue(CGSize: CGSizeMake(scaleX, scaleY))
            scaleTobiggerTotalTimeButton.springBounciness = 20
            scaleTobiggerTotalTimeButton.springSpeed = 20
            self.totalTimeButton.pop_addAnimation(scaleTobiggerTotalTimeButton, forKey: "scaleTobigerTotalTimeButton")
        }
    }
    
    
//    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
//    
//    prop.writeBlock = ^(id obj, const CGFloat values[]) {
//    UILabel *lable = (UILabel*)obj;
//    label.text = [NSString stringWithFormat:@"%02d:%02d:%02d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
//    };
//    
//    //        prop.threshold = 0.01f;
//    }];
//    
//    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
//    anBasic.property = prop;    //自定义属性
//    anBasic.fromValue = @(0);   //从0开始
//    anBasic.toValue = @(3*60);  //180秒
//    anBasic.duration = 3*60;    //持续3分钟
//    anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
//    [label pop_addAnimation:anBasic forKey:@"countdown"];
    


    

    
}
