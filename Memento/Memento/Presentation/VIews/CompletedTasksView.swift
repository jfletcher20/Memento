//
//  CompletedTasksView.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct CompletedTasksView: View {
    @FetchRequest(
        entity: TaskDataModel.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskDataModel.dueDate, ascending: true)]
    ) var tasks: FetchedResults<TaskDataModel>
    
    var body: some View {
        VStack {
            if tasks.filter { $0.completed }.isEmpty {
                Text("Completed tasks will appear here.")
            } else {
                List(tasks.filter { $0.completed }) { task in
                    TaskCardWidget(task: task)
                }
            }
        }
    }
}

struct CompletedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasksView()
    }
}
