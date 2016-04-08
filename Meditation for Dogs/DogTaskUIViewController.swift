//
//  DetailViewController.swift
//  Meditation for Dogs
//
//  Created by Whitney Powell on 3/31/16.
//  Copyright © 2016 Whitney Powell. All rights reserved.
//

import UIKit

class DogTaskUIViewController: UIViewController {


    @IBOutlet weak var dogTaskLabel: UILabel!
    @IBOutlet weak var taskNumberLabel: UILabel!


    var task: String?
    var taskNumber: Int?
    var tasks: Int?

    func configureView() {
        if let task = self.task {
            if let label = self.dogTaskLabel {
                label.text = task
            }
        }
        if let taskNumber = self.taskNumber, let label = self.taskNumberLabel, let totalTasks = self.tasks {
            //print("here")
            label.text = "\(taskNumber + 1)/\(totalTasks)"
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

