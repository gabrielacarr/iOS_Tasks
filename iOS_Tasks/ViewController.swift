//
//  ViewController.swift
//  iOS_Tasks
//
//  Created by Brie New on 5/13/21.
//

import UIKit

class ViewController: UIViewController {

    // Control table view on storyboard
    @IBOutlet var tableView: UITableView!

    // Array holds all tasks created by user
    var tasks = [String]()

    override func viewDidLoad() {
        // Get all saved tasks
        super.viewDidLoad()
        self.title = "Tasks"

        // Connect delegate
        tableView.delegate = self
        tableView.dataSource = self

        // Save task setup
        // Check if no tasks, if true, given count value of 0
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        // Get current saved tasks
        updateTasks()
    }

    func updateTasks() {

        // Avoids duplicates
        tasks.removeAll()

        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }

        // Iterate through 0 until count
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                tasks.append(task)
            }
        }

        // Reload table
        tableView.reloadData()

    }

    // Once Add button is clicked/ tapped
    @IBAction func didTapAdd() {

        // To Add: Instantiate EntryViewController
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"

        // Prioritize refetch saved tasks
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// Implement functions to return number of rows from tasks array
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    // Does not return if there is tasks string is empty
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Position of cell in table
        cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }
}
