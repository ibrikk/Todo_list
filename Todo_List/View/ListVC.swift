//
//  ListVC.swift
//  Todo_List
//
//  Created by Ibrahim Khalilov on 2022-11-13.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var todos: [String] = ["Do the dishes", "Walk the dog"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addPressed(_ sender: Any) {
        alertWithTextField(with: "Add Item",
                           "",
                           "Add",
                           "Cancel",
                           " Enter Here") { text in
            // Save Data
            // Update List
            
        }
                           
                           }
                           }
                           
                           extension ListVC: UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                todos.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
                let todo = todos[indexPath.row]
                cell.textLabel?.text = todo
                return cell
            }
            
            
        }
