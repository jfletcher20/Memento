//
//  MockData.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import Foundation
import SwiftUI

class Mock {
    static private var tasks: Array<Task> = [
        Task(name: "Submit seminar", dueDate: Date().addingTimeInterval(TimeInterval(120)), category: getTaskCategories()[0], completed: false),
        Task(name: "Prepare for laboratory exercises", dueDate: Date().addingTimeInterval(TimeInterval(120)), category: getTaskCategories()[1], completed: false),
        Task(name: "Gather a team", dueDate: Date(), category: getTaskCategories()[0], completed: true),
        Task(name: "Set up environment", dueDate: Date(), category: getTaskCategories()[2], completed: false),
    ];
    static private var taskCategories: Array<TaskCategory> = [
        TaskCategory(name: "RAMPU", color: .blue),
        TaskCategory(name: "RPP", color: .red),
        TaskCategory(name: "RWA", color: .orange),
    ]
    static func getTasks() -> Array<Task> {
        return tasks;
    }
    static func getTaskCategories() -> Array<TaskCategory> {
        return taskCategories;
    }
    static func addTask(_ task: Task) {
        tasks.append(task);
    }
}
