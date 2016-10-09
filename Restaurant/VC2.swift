//
//  VC2.swift
//  Restaurant
//
//  Created by Daricus Duncan on 10/6/16.
//  Copyright © 2016 DrDunkan. All rights reserved.
//

import UIKit

extension UIView {
    func toImage2() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        
        drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class VC2: UIViewController {

    @IBOutlet weak var ItemLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var UseByLabel: UILabel!
    @IBOutlet weak var MgrLabel: UILabel!
    @IBOutlet weak var EmpLabel: UILabel!
    
    var ItemVC2  = String()
    var DayOfWeekVC2 = String()
    var DateOfInstanceVC2 = String()
    var TimeOfInstanceVC2 = String()
    var ExpirationDateVC2 = String()
    var ManagerVC2 = String()
    var EmployeeVC2 = String()
    var DayOfExpirationVC2 = String()
    var VolumeVC2 = String()
    var WeightVC2 = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    ItemLabel.text = ItemVC2
    DateLabel.text = DateOfInstanceVC2
    TimeLabel.text = TimeOfInstanceVC2
    UseByLabel.text = ExpirationDateVC2
    MgrLabel.text = ManagerVC2
    EmpLabel.text = EmployeeVC2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func printButton(sender: AnyObject) {
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = UIPrintInfoOutputType.General
        printInfo.jobName = "My Print Job"
        
        // Set up print controller
        let printController = UIPrintInteractionController.sharedPrintController()
        printController.printInfo = printInfo
        
        // Assign a UIImage version of my UIView as a printing iten
        printController.printingItem = self.view.toImage2()
        
        // Do it
        printController.presentFromRect(self.view.frame, inView: self.view, animated: true, completionHandler: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
