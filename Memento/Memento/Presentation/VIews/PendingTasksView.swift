//
//  PendingTasksView.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct PendingTasksView: View {
    
    @Environment(\.managedObjectContext) var context;
    
    @FetchRequest(
        entity: TaskDataModel.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskDataModel.dueDate, ascending: true)]
    ) var tasks: FetchedResults<TaskDataModel>
    
    @State private var showOptionsDialog: Bool = false;
    
    var body: some View {
        ZStack {
            VStack {
                if tasks.filter { !$0.completed }.isEmpty {
                    Text("Pending tasks will appear here.")
                } else {
                    List(tasks.filter { !$0.completed }) { task in
                        TaskCardWidget(task: task).onTapGesture {
                            showOptionsDialog = true;
                        }.confirmationDialog(task.name ?? "Unknown task", isPresented: $showOptionsDialog) {
                            Button("Mark as complete", action: {
                                task.completed = true;
                                try? context.save();
                                showOptionsDialog = false;
                            })
                            Button("Delete task", action: {
                                context.delete(task);
                                try? context.save();
                                showOptionsDialog = false;
                            })
                        }
                    }
                }
            }
            NewTaskWidget(onNewTask: onNewTask)
        }
    }
    func onNewTask(task: TaskDataModel) {
        CoreDataStack.shared.commit();
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        PendingTasksView()
    }
}
