//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Анастасия on 22.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let toDoTableView = UITableView()
    
    private var model = [ToDoListApp]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    //MARK: - functions
    func getAllItems() {
       
        do {
            model = try context.fetch(ToDoListApp.fetchRequest())
            DispatchQueue.main.async {
                self.toDoTableView.reloadData()
            }
        } catch {
            
        }
    }
    
    func creatItem(name: String) {
        
        let newItem = ToDoListApp(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
        
    }
    
    func deleteItem(item: ToDoListApp) {
        
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    func updateItem(item: ToDoListApp, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }


}

