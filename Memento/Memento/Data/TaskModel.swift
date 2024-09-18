//
//  TaskModel.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import Foundation

struct Task: Identifiable {
    let id: UUID = UUID();
    let name: String;
    let dueDate: Date;
    let category: TaskCategory;
    let completed: Bool;
}
