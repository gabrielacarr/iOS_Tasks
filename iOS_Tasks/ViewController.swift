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
        super.viewDidLoad()
        // Get all current saved tasks
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
