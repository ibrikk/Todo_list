//
//  ListVC.swift
//  Todo_List
//
//  Created by Ibrahim Khalilov on 2022-11-13.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTableView()
    }
    // Private is used within the same file but different classes
    // Private only within the class itself
    fileprivate func updateTableView() {
        viewModel.fetchData()
        table.reloadData()
    }
    
    @IBAction func addPressed(_ sender: Any) {
        alertWithTextField(with: "Add Item",
                           "", // Empty
                           "Add",
                           "Cancel",
                           "Enter Here") { text in
            if !text.isEmpty {
                self.viewModel.saveData(title: text)
                self.updateTableView()
            }
        }
    }
}

extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        let todo = viewModel.listArray[indexPath.row].title
        cell.textLabel?.text = todo
        return cell
    }
}

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteData(index: indexPath.row)
            updateTableView()
        }
    }
}
