//
//  ToDoList+CoreDataProperties.swift
//  ToDoListApp
//
//  Created by Анастасия on 22.07.2024.
//
//

import Foundation
import CoreData


extension ToDoListApp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListApp> {
        return NSFetchRequest<ToDoListApp>(entityName: "ToDoListApp")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension ToDoListApp : Identifiable {

}
