//
//  GDAddTimeView.swift
//  POCPickDateAddTime
//
//  Created by Liu Jingkai on 16/6/29.
//  Copyright © 2016年 Liu Jingkai. All rights reserved.
//

import UIKit
import SnapKit


class GDAddTimeView: UIView {

    let viewBackgroundColor = UIColor.darkGrayColor()
    
    let timerButton = UIButton()
    let timerButtonColor = UIColor.blueColor()
    
    
    let totalTimeButton = UIButton()
    let totalTimeButtonColor = UIColor.blueColor()

    
    var addTimeButtons = [UIButton]()   // Add Time button 1 3 5 10 15 30 45 60, 8 items
    let addTimeButtonsColor = UIColor.darkGrayColor()
    
    

    //Only override drawRect: if you perform custom drawing.
    //An empty implementation adversely affects performance during animation.
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
        
        // Add addTimeButtons
        for i in 0...7 {
            let addTimeButton = UIButton()
            addTimeButtons.append(addTimeButton)
            addTimeButtons[i].backgroundColor = addTimeButtonsColor
            addTimeButtons[i].layer.cornerRadius = self.bounds.height/20
        }
        
        // Add the 1st button: 1 min
        addTimeButtons[0].setTitle("1", forState: .Normal)
        self.addSubview(addTimeButtons[0])
        
        addTimeButtons[0].snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(-self.bounds.height/3)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 2nd button: 3 min
        addTimeButtons[1].setTitle("3", forState: .Normal)
        self.addSubview(addTimeButtons[1])
        
        addTimeButtons[1].snp_makeConstraints { (make) in
            let parameterA = self.bounds.height/(3*sqrt(2))
            make.centerX.equalTo(parameterA)
            make.centerY.equalTo(-parameterA)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        
        // Add the 3rd button: 5 min
        addTimeButtons[2].setTitle("5", forState: .Normal)
        self.addSubview(addTimeButtons[2])
        
        addTimeButtons[2].snp_makeConstraints { (make) in
            make.centerX.equalTo(self.bounds.width/3)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 4th button: 10 min
        addTimeButtons[3].setTitle("10", forState: .Normal)
        self.addSubview(addTimeButtons[3])
        
        addTimeButtons[3].snp_makeConstraints { (make) in
            let parameterA = self.bounds.height/(3*sqrt(2))
            make.centerX.equalTo(parameterA)
            make.centerY.equalTo(parameterA)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }
        
        // Add the 5th button: 15 min
        addTimeButtons[4].setTitle("15", forState: .Normal)
        self.addSubview(addTimeButtons[4])
        
        addTimeButtons[4].snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self.bounds.height/3)
            make.size.equalTo(CGSizeMake(self.bounds.height/10, self.bounds.width/10))
        }

        // Add the 6th button: 30 min
        addTimeButtons[5].setTitle("30", forState: .Normal)
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

    
    func recordTime(sender:AnyObject){
        NSLog("Click record time button")

        
        
    }
    
    
    
    
    
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
//    
//    NSInteger height = CGRectGetHeight(self.view.bounds);
//    NSInteger width = CGRectGetWidth(self.view.bounds);
//    
//    CGFloat centerX = arc4random() % width;
//    CGFloat centerY = arc4random() % height;
//    
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
//    anim.springBounciness = 16;
//    anim.springSpeed = 6;
//    [self.testView pop_addAnimation:anim forKey:@"center"];
    
    
    
    
    
    
    
//    var addTimeArray: [Int] = [0]

    
    

    
}
