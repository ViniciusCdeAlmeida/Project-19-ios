//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var itemList = ["Number one", "Number two", "Number three"]

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        if let itens = defaults.array(forKey: "todoList") as? [String] {
            itemList = itens
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemList[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        var newItem = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Item", style: .default) { _ in
            self.itemList.append(newItem.text!)
            self.defaults.set(self.itemList, forKey: "todoList")
            self.tableView.reloadData()
        }
        alert.addTextField {
            alert in
            newItem = alert
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
