//
//  PendingTasksView.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct PendingTasksView: View {
    var body: some View {
        VStack {
            if Mock.getTasks().filter { !$0.completed }.isEmpty {
                Text("Pending tasks will appear here.")
            } else {
                List(Mock.getTasks().filter { !$0.completed }) { task in
                    TaskCardWidget(task: task).onTapGesture {
                        // showingDialog = task;
                    }
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        PendingTasksView()
    }
}
