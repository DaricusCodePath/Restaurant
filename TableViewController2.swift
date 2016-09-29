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
}

class TableViewController2: UITableViewController {
    
    var posts = [postStruct]()
    
    
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
            
            
            
            self.posts.insert(postStruct(Item: Item,DayOfWeek: DayOfWeek,DateOfInstance: DateOfInstance,TimeOfInstance: TimeOfInstance,ExpirationDate: ExpirationDate,Manager: Manager,Employee: Employee,DayOfExpiration: DayOfExpiration), atIndex: 0)
            
           // print(self.posts)
            self.tableView.reloadData()

        })
        
        //print(posts.count)
            

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
        
        let ItemLabel = cell?.viewWithTag(1) as! UILabel
        ItemLabel.text = posts[indexPath.row].Item
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
