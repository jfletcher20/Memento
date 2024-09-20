//
//  PendingTasksView.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct PendingTasksView: View {
    @State private var tasks = Mock.getTasks();
    var body: some View {
        ZStack {
            VStack {
                if tasks.filter { !$0.completed }.isEmpty {
                    Text("Pending tasks will appear here.")
                } else {
                    List(tasks.filter { !$0.completed }) { task in
                        TaskCardWidget(task: task).onTapGesture {
                            // showingDialog = task;
                        }
                    }
                }
            }
            NewTaskWidget(onNewTask: onNewTask)
        }
    }
    func onNewTask(task: Task) {
        tasks.append(task);
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        PendingTasksView()
    }
}
