//
//  CompletedTasksView.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct CompletedTasksView: View {
    var body: some View {
        VStack {
            if Mock.getTasks().filter { $0.completed }.isEmpty {
                Text("Completed tasks will appear here.")
            } else {
                List(Mock.getTasks().filter { $0.completed }) { task in
                    TaskCardWidget(task: task).onTapGesture {
                        // showingDialog = task;
                    }
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
