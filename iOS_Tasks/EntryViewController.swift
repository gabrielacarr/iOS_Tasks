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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Prompt to save once done is selected
        field.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()

        return true
    }
    @IBAction func saveTask() {

    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


