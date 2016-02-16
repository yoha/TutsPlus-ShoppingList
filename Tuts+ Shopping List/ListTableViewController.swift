//
//  ListTableViewController.swift
//  Tuts+ Shopping List
//
//  Created by Yohannes Wijaya on 2/11/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    // MARK: - Stored Properties
    
    var items: [Item] = []
    
    // MARK: NSCoding Protocol Methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.loadItems()
    }
    
    // MARK: - Helper Methods
    
    private func loadItems() {
        guard let validFilePath = self.pathToSavedItemsFile() where NSFileManager.defaultManager().fileExistsAtPath(validFilePath) else { return }
        guard let validArchivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(validFilePath) as? [Item] else { return }
        self.items = validArchivedItems
    }
    
    private func pathToSavedItemsFile() -> String? {
        let pathsToSpecifiedDirectoryInDomain = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        guard let validFilePath = pathsToSpecifiedDirectoryInDomain.first, let validFilePathUrl = NSURL(string: validFilePath) else { return nil }
        return validFilePathUrl.URLByAppendingPathComponent("items.plist").path
    }
    
    private func saveItems() {
        guard let validFilePathToSave = self.pathToSavedItemsFile() else { return }
        NSKeyedArchiver.archiveRootObject(self.items, toFile: validFilePathToSave)
    }
    
    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("items: \(self.items)")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
