//
//  TextPicker.swift
//  ToDoList
//
//  Created by Динмуханбет Айжарыков on 19.06.2024.
//

import UIKit

class TextPicker {
    func showPicker(in viewController: UIViewController, completion: @escaping ((String)-> Void)) {
        let alertController = UIAlertController(title: "ToDoItem", message: nil, preferredStyle: .alert)
        
        alertController.addTextField()
        
        let actionOk = UIAlertAction(title: "OK", style: .default) {
            _ in if let text = alertController.textFields?[0].text, text != "" {
                completion(text)
            }
        }
        
        let actionCancel = UIAlertAction(title: "Title", style: .cancel)
        
        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        
        viewController.present(alertController, animated: true)
    }
}
