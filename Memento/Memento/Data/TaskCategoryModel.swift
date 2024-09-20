//
//  TaskCategoryModel.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import Foundation
import SwiftUI

struct TaskCategory: Identifiable {
    let id: UUID = UUID();
    let name: String;
    let color: Color;
}

extension TaskCategory: Hashable {
    static func == (lhs: TaskCategory, rhs: TaskCategory) -> Bool {
        return lhs.id == rhs.id;
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name);
        hasher.combine(color);
        hasher.combine(id);
    }
}
