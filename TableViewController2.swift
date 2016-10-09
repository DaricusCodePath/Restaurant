//
//  TableViewController2.swift
//  Restaurant
//
//  Created by Daricus Duncan on 9/28/16.
//  Copyright © 2016 DrDunkan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct postStruct {
    
    let Item : String!
    let DayOfWeek : String!
    let DateOfInstance : String!
    let TimeOfInstance : String!
    let ExpirationDate : String!
    let Manager : String!
    let Employee : String!
    let DayOfExpiration : String!
    let Volume : String!
    let Weight : String!
}


class TableViewController2: UITableViewController {
    
    var posts = [postStruct]()
    
    var Item2pass : String!
    var DayOfWeek2pass : String!
    var DateOfInstance2pass : String!
    var TimeOfInstance2pass : String!
    var ExpirationDate2pass : String!
    var Manager2pass : String!
    var Employee2pass : String!
    var DayOfExpiration2pass : String!
    var Volume2pass : String!
    var Weight2pass : String!
    
    
    
    
    var storeDayValue: Int?
    let DaysOfWeek = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let databaseRef = FIRDatabase.database().reference()
        
        databaseRef.child("Posts").queryOrderedByKey().observeEventType(.ChildAdded, withBlock: {
            snapshot in
            
            let Item = snapshot.value!["Item"] as! String
            let DayOfWeek = snapshot.value!["DayOfWeek"] as! String
            let DateOfInstance  = snapshot.value!["DateOfInstance"] as! String
            let TimeOfInstance = snapshot.value!["TimeOfInstance"] as! String
            let ExpirationDate = snapshot.value!["ExpirationDate"] as! String
            let Manager = snapshot.value!["Manager"] as! String
            let Employee = snapshot.value!["Employee"] as! String
            let DayOfExpiration = snapshot.value!["ExpirationDay"] as! String
            let Weight = snapshot.value!["Weight"] as! String
            let Volume = snapshot.value!["Volume"] as! String
            
            
            if(self.DaysOfWeek[self.storeDayValue!] == DayOfExpiration)
            {
                
            
            self.posts.insert(postStruct(Item: Item,DayOfWeek: DayOfWeek,DateOfInstance: DateOfInstance,TimeOfInstance: TimeOfInstance,ExpirationDate: ExpirationDate,Manager: Manager,Employee: Employee,DayOfExpiration: DayOfExpiration,Volume: Volume,Weight: Weight), atIndex: 0)
            
           // print(self.posts)
                self.tableView.reloadData()
                
            
            }
            //print(self.posts)


        })
        
        //print(posts.count)
            

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        print(storeDayValue)
        //print(posts.count)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell2")
        //print(indexPath.row)
        var PrintData = (self.posts.description)
        print(PrintData)
        
        //var Day = posts.count
//        print(posts.count)
//        
//        print(Day)
//        print(Day)
//        print(Day)
//        
//        if(Day == "Wednesday"){
//           let label1 = cell.viewWithTag(1) as! UILabel
//            label1.text = posts[indexPath.row].Item
//            print("Working")
//        }
//        else{
//            print("No data was found")
//        }
        

        // Configure the cell...
        //print(storeDayValue)
        
        let ItemLabel = cell?.viewWithTag(1) as! UILabel
        ItemLabel.text = posts[indexPath.row].Item
        Item2pass = ItemLabel.text
        
        let DateCreatedLabel = cell?.viewWithTag(2) as! UILabel
        DateCreatedLabel.text = posts[indexPath.row].DateOfInstance
        DateOfInstance2pass = DateCreatedLabel.text
        
        let TimeLabel = cell?.viewWithTag(3) as! UILabel
        TimeLabel.text = posts[indexPath.row].TimeOfInstance
        TimeOfInstance2pass = TimeLabel.text
        
        let TimeLabel2 = cell?.viewWithTag(10) as! UILabel
        TimeLabel2.text = posts[indexPath.row].TimeOfInstance
        
        let ExpireDateLabel = cell?.viewWithTag(4) as! UILabel
        ExpireDateLabel.text = posts[indexPath.row].ExpirationDate
        ExpirationDate2pass = ExpireDateLabel.text
        
        let ManagerLabel = cell?.viewWithTag(5) as! UILabel
        ManagerLabel.text = posts[indexPath.row].Manager
        Manager2pass = ManagerLabel.text
        
        let EmployeeLabel = cell?.viewWithTag(6) as! UILabel
        EmployeeLabel.text = posts[indexPath.row].Employee
        Employee2pass = EmployeeLabel.text
        
        let WeightLabel = cell?.viewWithTag(7) as! UILabel
        WeightLabel.text = posts[indexPath.row].Weight
        Weight2pass = WeightLabel.text
        
        let VolumeLabel = cell?.viewWithTag(8) as! UILabel
        VolumeLabel.text = posts[indexPath.row].Volume
        Volume2pass = VolumeLabel.text
        
        
        //print(Day)

        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var secondView2:VC2 = segue.destinationViewController as! VC2
        
        print(Item2pass)
        
        secondView2.ItemVC2 = Item2pass
        secondView2.DateOfInstanceVC2 = DateOfInstance2pass
        secondView2.TimeOfInstanceVC2 = TimeOfInstance2pass
        secondView2.ExpirationDateVC2 = ExpirationDate2pass
        secondView2.ManagerVC2 = Manager2pass
        secondView2.EmployeeVC2 = Employee2pass

        /*
        secondView2.DateLabel.text = DateOfInstance2pass
        secondView2.ItemLabel.text = Item2pass
        secondView2.TimeLabel.text = TimeOfInstance2pass
        secondView2.UseByLabel.text = ExpirationDate2pass
        secondView2.MgrLabel.text = Manager2pass
        secondView2.EmpLabel.text = Employee2pass
        */
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
