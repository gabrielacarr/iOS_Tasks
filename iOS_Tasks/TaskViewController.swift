//
//  TaskViewController.swift
//  iOS_Tasks
//
//  Created by Brie New on 5/13/21.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label: UILabel!

    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }

    // Delete task
    @objc func deleteTask() {
// Remove + ajust count position
//        let newCount = count - 1
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")

    }



}
