//
//  ListController.swift
//  ToDoList
//
//  Created by Динмуханбет Айжарыков on 19.06.2024.
//

import UIKit



class ListController: UITableViewController {
    
        var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func pushAddAction(_ sender: Any) {
        TextPicker().showPicker(in: self) { [weak self] text in
            self?.model.addItem(title: text)
            self?.tableView.reloadData()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var configuration = UIListContentConfiguration.cell()
        configuration.text = model.items[indexPath.row].title
        configuration.secondaryText = model.items[indexPath.row].date.formatted(date: .complete, time: .shortened)

        cell.contentConfiguration = configuration

        cell.accessoryType = model.items[indexPath.row].isCompleted ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal , title: "Rename") {
            _, _, completion in 
            TextPicker().showPicker(in: self) { [weak self] text in
                
                self?.model.renameItem(atIndex: indexPath.row, newTitle: text)
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
                completion(true)
            }
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive , title: "Delete") {
            _, _, completion in
            self.model.deleteItem(atIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.toogleItem(atIndex: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
