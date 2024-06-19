//
//  Model.swift
//  ToDoList
//
//  Created by Динмуханбет Айжарыков on 19.06.2024.
//

import Foundation


class ToDoItem: Codable {
    var title: String
    var date: Date
    var isCompleted: Bool
    init(title: String, date: Date, isCompleted: Bool) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
    

    
}


class Model {
    var items: [ToDoItem] = []
    
    func addItem(title: String) {
        items.append(ToDoItem(title: title, date: Date(), isCompleted: false))
    }
    
    func deleteItem(atIndex index: Int) {
        items.remove(at: index)
    }
    
    func renameItem(atIndex index: Int, newTitle: String) {
        items[index].title = newTitle
        
    }
    
    func toogleItem(atIndex index: Int) {
        items[index].isCompleted.toggle()
    }
}
