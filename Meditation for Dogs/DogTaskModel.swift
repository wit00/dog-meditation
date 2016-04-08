//
//  DogTaskModel.swift
//  Meditation for Dogs
//
//  Created by Whitney Powell on 4/5/16.
//  Copyright © 2016 Whitney Powell. All rights reserved.
//

import UIKit

class DogTaskModel:NSObject, UIPageViewControllerDataSource {
    var currentTask = 0
    var day:Int {
        didSet {
            setTodaysTasksFromPList(day)
        }
    }
    var todaysTasks:[String] = []
    
    init(day:Int) {
        self.day = day
        super.init()
        setTodaysTasksFromPList(day)
    }
    
    private func setTodaysTasksFromPList(day:Int) {
        todaysTasks = getTasksFromPListForADay(day)
    }
    
    private func getTasksFromPListForADay(aDay:Int) -> [String] {
        if let path = NSBundle.mainBundle().pathForResource("day\(day)", ofType: "plist"), dictionary = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            return (dictionary["tasks"] as? [String])!
        }
        return []
    }
    
    private func indexOfViewController(dogViewController:DogTaskUIViewController) -> Int {        
        return todaysTasks.indexOf(dogViewController.task!) ?? NSNotFound
    }
    
    private func getDogTasksViewControllerForTodaysTasks(nextTask:Int,storyboard:UIStoryboard) -> DogTaskUIViewController {
        let dogTaskUIViewController = storyboard.instantiateViewControllerWithIdentifier("dog's tasks view controller") as! DogTaskUIViewController
        dogTaskUIViewController.task = todaysTasks[nextTask]
        dogTaskUIViewController.taskNumber = nextTask
        dogTaskUIViewController.tasks = todaysTasks.count
        return dogTaskUIViewController
    }
    
    func getViewControllerForDayAndTask(storyboard:UIStoryboard,aDay:Int,aTask:Int) -> DogTaskUIViewController {
        let dogTaskUIViewController = storyboard.instantiateViewControllerWithIdentifier("dog's tasks view controller") as! DogTaskUIViewController
        let thatDaysTasks = getTasksFromPListForADay(aDay)
        dogTaskUIViewController.task = thatDaysTasks[aTask]
        dogTaskUIViewController.taskNumber = aTask
        dogTaskUIViewController.tasks = thatDaysTasks.count
        return dogTaskUIViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard currentTask > 0 else {
            return nil
        }
        return getDogTasksViewControllerForTodaysTasks(currentTask-1, storyboard: viewController.storyboard!)
    }


    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard currentTask < todaysTasks.endIndex-1 else {
            return nil
        }
        return getDogTasksViewControllerForTodaysTasks(currentTask + 1, storyboard: viewController.storyboard!)
    }
    
 


}