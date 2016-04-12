//
//  DetailViewController.swift
//  Meditation for Dogs
//
//  Created by Whitney Powell on 3/31/16.
//  Copyright © 2016 Whitney Powell. All rights reserved.
//

import UIKit

class DogTaskUIViewController: UIViewController {


    @IBOutlet weak var swipeImage: UIImageView!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var dogTaskLabel: UILabel!
    @IBOutlet weak var taskNumberLabel: UILabel!


    var task: String?
    var taskNumber: Int?
    var tasks: Int?
    var day: Int?

    func configureView() {
        if let task = self.task {
            if let label = self.dogTaskLabel {
                label.text = task
            }
        }
        if let taskNumber = self.taskNumber, let label = self.taskNumberLabel, let totalTasks = self.tasks {
            label.text = "\(taskNumber + 1)/\(totalTasks)"
        }
        if taskNumber > 0 {
            swipeImage.alpha = 0.2
            swipeLabel.alpha = 0.2
        }
        

    }
    
    override func viewWillDisappear(animated: Bool) {
        let standardUserDefaults = NSUserDefaults.standardUserDefaults()
        if taskNumber > 0 && taskNumber != nil && day != nil {
            print("\(taskNumber)")
            standardUserDefaults.setObject(taskNumber!, forKey: "lastTask")
            standardUserDefaults.setObject(day!, forKey: "lastDay")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

