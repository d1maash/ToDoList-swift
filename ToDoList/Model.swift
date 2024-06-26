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
    
    init() {
        loadData()
    }
    
    func addItem(title: String) {
        items.append(ToDoItem(title: title, date: Date(), isCompleted: false))
        saveData()
    }
    
    func deleteItem(atIndex index: Int) {
        items.remove(at: index)
        saveData()
    }
    
    func renameItem(atIndex index: Int, newTitle: String) {
        items[index].title = newTitle
        saveData()
        
    }
    
    func toogleItem(atIndex index: Int) {
        items[index].isCompleted.toggle()
        saveData()
    }
    
    let url = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0].appending(path: "database.data")
    
    private func saveData() {
        print(url)
        let data = try? JSONEncoder().encode(items)
        try? data?.write(to: url)
    }
    
    private func loadData() {
        if let data = try? Data(contentsOf: url) {
            items =  (try? JSONDecoder().decode([ToDoItem].self, from: data)) ?? []
        }
        
       
    }
    

}
