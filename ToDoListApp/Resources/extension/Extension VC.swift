//
//  Extension VC.swift
//  ToDoListApp
//
//  Created by Анастасия on 22.07.2024.
//

import Foundation
import UIKit

extension ViewController {
    
    func settingsNavigationController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
    }
    
    @objc func addNewTask() {
        
        let alertController = UIAlertController(title: "Add new task", message: "Вы уверены что хотите добавить новую задачу", preferredStyle:.alert)
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "create", style: .default, handler: { [weak self ] _ in
            guard let field = alertController.textFields?.first, let text = field.text, text.isEmpty else {
                return
            }
            
            self?.creatItem(name: text)
        }))
        
        present(alertController, animated: true)
    }
    
}
