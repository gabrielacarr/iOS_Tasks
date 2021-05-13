//
//  EntryViewController.swift
//  iOS_Tasks
//
//  Created by Brie New on 5/13/21.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    // User enters a task + done button function to save
    @IBOutlet var field: UITextField!

    // Update tasks to refect new task
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Prompt to save once done is selected
        field.delegate = self

        // Save button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()

        return true
    }
    // @objc allows func to be used as #selector
    @objc func saveTask() {
        // If field is not empty, save content of input fields
        guard let text = field.text, !text.isEmpty else {
            return
        }

        // Save task using user default + count of task + task with number
        // Guard againt count becoming nil
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }

        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")

        // Save task with updated count
        UserDefaults().set(text, forKey: "task_\(newCount)")

        // Call func is update func exist
        update?()

        // Dismiss func
        navigationController?.popViewController(animated: true)
    }
}





