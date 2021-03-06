//
//  ViewController.swift
//  FirebaseDatabase
//
//  Created by Daricus Duncan on 9/13/16.
//  Copyright © 2016 DrDunkan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

extension UIView {
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        
        drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var UseByLabel: UILabel!
    
    @IBOutlet weak var DayLabel: UILabel!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var ItemLabel: UITextField!
    
    @IBOutlet weak var MgrLabel: UITextField!
    
    @IBOutlet weak var EmpLabel: UITextField!
    
    @IBOutlet weak var WTLabel: UITextField!
    
    @IBOutlet weak var VolLabel: UITextField!
    
    var ExpirationDay : String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("getTime"), userInfo: nil, repeats: true)
        
        let todayDate = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let myComponents = myCalendar?.components(.Weekday, fromDate: todayDate)
        let weekDay = myComponents?.weekday
        
        print(weekDay!)
        
        var Week = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        
        
        DayLabel.text = Week[weekDay!-1]
        
        var newDate = addDaystoGivenDate(NSDate(), NumberOfDaysToAdd: 6)
        
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let strDate = dateFormatter.stringFromDate(newDate)
        print("New Time\(strDate)")
        
        UseByLabel.text = strDate
        
        let myCalendar2 = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let myComponents2 = myCalendar2?.components(.Weekday, fromDate: newDate)
        let weekDay2 = myComponents2?.weekday
        
        print(weekDay!)
        
        print(weekDay2!) //Expiration Day of the week
        
        ExpirationDay = Week[weekDay2!]
        print(ExpirationDay)
        
    }
    
    
    
    func getTime(){
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        //formatter.timeStyle = NSDateFormatterStyle.MediumStyle
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        DateLabel.text = formatter.stringFromDate(currentDateTime)
        
        let formatter2 = NSDateFormatter()
        formatter2.timeStyle = NSDateFormatterStyle.MediumStyle
        //formatter2.dateStyle = NSDateFormatterStyle.MediumStyle
        TimeLabel.text = formatter2.stringFromDate(currentDateTime)
    }
    
    func addDaystoGivenDate(baseDate:NSDate,NumberOfDaysToAdd:Int)->NSDate
    {
        let dateComponents = NSDateComponents()
        let CurrentCalendar = NSCalendar.currentCalendar()
        let CalendarOption = NSCalendarOptions()
        
        dateComponents.day = NumberOfDaysToAdd-1
        
        let newDate = CurrentCalendar.dateByAddingComponents(dateComponents, toDate: baseDate, options: CalendarOption)
        
        return newDate!
    }
    
    func LabelData(){
        let Item = ItemLabel.text
        let DayOfWeek = DayLabel.text
        let DateOfInstance = DateLabel.text
        let TimeOfInstance = TimeLabel.text
        let ExpirationDate = UseByLabel.text
        let Manager = MgrLabel.text
        let Employee = EmpLabel.text
        let DayOfExpiration = ExpirationDay
        
        let Weight = WTLabel.text
        let Volume = VolLabel.text
        
        let post : [String : AnyObject] = ["Item" : Item!,
                                           "DayOfWeek" : DayOfWeek!,
                                           "DateOfInstance" : DateOfInstance!,
                                           "TimeOfInstance" : TimeOfInstance!,
                                           "ExpirationDate" : ExpirationDate!,
                                           "Manager" : Manager!,
                                           "Employee" : Employee!,
                                           "ExpirationDay" : DayOfExpiration!,
                                           "Weight" : (Weight)!             ,
                                           "Volume" : (Volume)!          ]
        
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Posts").childByAutoId().setValue(post)
        
        
    }
    
    @IBAction func SaveButtonPress(sender: AnyObject) {
        LabelData()
    }
    
    @IBAction func printButton(sender: AnyObject) {
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.General
        printInfo.jobName = "My Print Job"
        
        // Set up print controller
        let printController = UIPrintInteractionController.sharedPrintController()
        printController.printInfo = printInfo
        
        // Assign a UIImage version of my UIView as a printing iten
        printController.printingItem = self.view.toImage()
        
        // Do it
        printController.presentFromRect(self.view.frame, inView: self.view, animated: true, completionHandler: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

