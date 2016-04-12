//
//  ProtocolForRelaxationTableViewController.swift
//  Meditation for Dogs
//
//  Created by Whitney Powell on 4/11/16.
//  Copyright © 2016 Whitney Powell. All rights reserved.
//

import UIKit

class ProtocolForRelaxationTableViewController: UITableViewController {
    let dogTaskSegueIdentifier = "dogTaskSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func findResumeDayAndTask() -> (day:Int,task:Int) {
        let standardUserDefaults = NSUserDefaults.standardUserDefaults()
        if let day = standardUserDefaults.objectForKey("lastDay") as? Int {
            if let task = standardUserDefaults.objectForKey("lastTask") as? Int {
                return (day,task)
            } else {
                return (day,0)
            }
        }
        return (1,0)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == dogTaskSegueIdentifier {
            if let dogTaskUIPageViewController = segue.destinationViewController as? DogTaskUIPageViewController {
                let indexPath = sender as! NSIndexPath
                if indexPath.section == 0 {
                    let dayAndTask = findResumeDayAndTask()
                    dogTaskUIPageViewController.day = dayAndTask.day
                    dogTaskUIPageViewController.currentTask = dayAndTask.task
                } else {
                    dogTaskUIPageViewController.day = indexPath.row + 1
                    dogTaskUIPageViewController.currentTask = 0
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {        
        performSegueWithIdentifier(dogTaskSegueIdentifier, sender: indexPath)
    }

}
