//
//  TaskCategoryModel.swift
//  Memento
//
//  Created by JoshuaLeeFletcher
//

import Foundation
import SwiftUI

struct TaskCategory: Identifiable {
    let id: UUID = UUID();
    let name: String;
    let color: Color;
}
