//
//  ViewController.swift
//  POCPickDateAddTime
//
//  Created by Liu Jingkai on 15/10/10.
//  Copyright (c) 2015年 Liu Jingkai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerDate: UILabel!
    @IBOutlet weak var selectDate: ASDayPicker!
    
    @IBOutlet weak var displayTotalTime: UILabel! // Display Total Time in Label
    @IBOutlet weak var totalTime: UIButton! // Total Time button
    
    @IBOutlet var addTime: [UIButton]! // Add Time button 1 3 5 10 15 30 45 60
    
    var addTimeArray: [Int] = [0]

    @IBOutlet weak var sumTime: UILabel! // Display Sum Reading Time XXh XXm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Allow picking from today - 2 weeks to + 2 weeks
        var twoWeeksAgo = NSDateComponents()
        twoWeeksAgo.day = 2 * 7
        
        var twoWeeksBefore = NSDateComponents() as NSDateComponents
        twoWeeksBefore.day = -(2 * 7)
        
        var today = NSDate()
        
        var startDate = NSCalendar.currentCalendar().dateByAddingComponents(twoWeeksBefore, toDate: today, options: nil)
        var endDate = NSCalendar.currentCalendar().dateByAddingComponents(twoWeeksAgo, toDate: today, options: nil)
        
        selectDate.setStartDate(startDate, endDate: endDate)
        
        // Show selected date image
        selectDate.selectedDateBackgroundImage = UIImage(named: "Selected")
        
        // Observe whether selectDate has been setup a new value
        selectDate.addObserver(self, forKeyPath: "selectedDate", options: NSKeyValueObservingOptions.New, context: nil)
        
        //Default pickerDate as Today
        var day = NSDate()
        pickerDate.text = NSDateFormatter.localizedStringFromDate(day, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        
        //Setup Radius for totalTime and addTime button
        totalTime.layer.cornerRadius = 40
       
        var result: UIButton!
        for result in addTime {
            result.layer.cornerRadius = 15
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        if keyPath == "selectedDate"{
            var day = change[NSKeyValueChangeNewKey] as! NSDate
            pickerDate.text = NSDateFormatter.localizedStringFromDate(day, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        }
    }
    
    @IBAction func addTime(sender: UIButton) {
        
        var addTimeToArray = sender.titleLabel?.text?.toInt()
        
        addTimeArray.append(addTimeToArray!)
        
        var addTotalTime = 0
        for i in addTimeArray{
            addTotalTime += i
        }
        
        displayTotalTime.text = "\(addTotalTime)"
        
        if addTotalTime < 30{
            totalTime.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        }else if addTotalTime >= 30 && addTotalTime <= 60{
            totalTime.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
        }else{
            totalTime.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
        }
        
    }
    
    
    @IBAction func minusTime(sender: AnyObject) {
        
        if addTimeArray.count != 0 {
            
            addTimeArray.removeLast()
            
            var addTotalTime = 0
            for i in addTimeArray{
                addTotalTime += i
            }
            displayTotalTime.text = "\(addTotalTime)"
            
            if addTotalTime < 30{
                totalTime.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
            }else if addTotalTime >= 30 && addTotalTime <= 60{
                totalTime.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
            }else{
                totalTime.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
            }
        }
    }
}

