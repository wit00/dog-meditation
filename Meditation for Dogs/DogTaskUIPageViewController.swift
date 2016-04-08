//
//  DogTaskUIPageViewController.swift
//  Meditation for Dogs
//
//  Created by Whitney Powell on 4/4/16.
//  Copyright © 2016 Whitney Powell. All rights reserved.
//

import UIKit

class DogTaskUIPageViewController:UIViewController, UIPageViewControllerDelegate {
    var day:Int = 1 {
        didSet {
            dogTaskModelController.day = self.day
        }
    }
    
    @IBAction func refreshTasks(sender: UIBarButtonItem) {
        dogTaskModelController.currentTask = 0
        loadStartingViewController(1,aTask:0)
    }
    var dogTaskPageViewController: UIPageViewController?
    var dogTaskModelController:DogTaskModel {
        if _dogTaskModelController == nil {
            _dogTaskModelController = DogTaskModel(day: self.day)
        }
        return _dogTaskModelController!
    }
    var _dogTaskModelController:DogTaskModel? = nil
    
    // a convenience function, since we do this a couple of times in the code (once in setup and once for the refresh button)
    func loadStartingViewController(aDay:Int, aTask:Int) {
        let startingViewController:DogTaskUIViewController = self.dogTaskModelController.getViewControllerForDayAndTask(self.storyboard!, aDay: aDay, aTask: aTask)
        self.dogTaskPageViewController!.setViewControllers([startingViewController], direction: .Forward, animated: false, completion: {done in})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogTaskPageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("dog task page view controller") as? UIPageViewController
        self.dogTaskPageViewController?.delegate = self
        //MARK - fix this to start where you left off
        loadStartingViewController(1,aTask:0)
        self.dogTaskPageViewController?.dataSource = self.dogTaskModelController

        self.addChildViewController(self.dogTaskPageViewController!)
        self.view.addSubview(self.dogTaskPageViewController!.view)
        
        
        self.dogTaskPageViewController!.didMoveToParentViewController(self)
        //configure the page view controller and add it as a child view controller
    }

    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed && finished) {
            dogTaskModelController.currentTask = nextPossibleTaskIndex//((previousViewControllers[0] as? DogTaskUIViewController)?.taskNumber!)!
        }
    }
    var nextPossibleTaskIndex = 0
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        if let nextDogController = pendingViewControllers[0] as? DogTaskUIViewController {
            nextPossibleTaskIndex = nextDogController.taskNumber!
        }
    }

}