//
//  NewTaskDialog.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct NewTaskDialog: View {
    
    // Making use of native DismissAction via environment property wrapper
    @Environment(\.dismiss) var dismiss;
    
    var onNewTask: ((_ task: Task) -> ())?;
    
    @State var name: String = "New task";
    @State var category: TaskCategory = Mock.getTaskCategories()[0];
    @State var dueDate: Date = Date();
    
    @State private var availableCategories: Array<TaskCategory> = Mock.getTaskCategories();
    @State private var validForm: Bool = false;
    @State private var categoryPickerEnabled: Bool = false;
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    TextField("Task Name", text: $name).onChange(of: $name) { newValue in
                        validForm = newValue.wrappedValue.count > 0 && $category.wrappedValue.name.count > 0;
                    }
                    Button("Category: \($category.wrappedValue.name)") {
                        categoryPickerEnabled = true;
                    }.confirmationDialog("Task category", isPresented: $categoryPickerEnabled) {
                        ForEach(availableCategories) { c in
                            Button(c.name, action: {
                                category = c;
                            }).foregroundColor($category.wrappedValue.color)
                        }
                    }.foregroundColor($category.wrappedValue.color)
                    DatePicker("Due Time", selection: $dueDate, displayedComponents: .hourAndMinute)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    HStack {
                        Spacer()
                        Button("Save", action: {
                            let newTask = Task(name: name, dueDate: dueDate, category: category, completed: false);
                            Mock.addTask(newTask);
                            onNewTask != nil ? onNewTask.unsafelyUnwrapped(newTask) : nil;
                            dismiss(); // dismiss when saved
                        })
                        Spacer()
                    }
                }
            }
        }.padding()
    }
}

extension Binding: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        return "\(lhs)" == "\(rhs)";
    }
    
}

struct NewTaskDialog_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskDialog(onNewTask: nil)
    }
}
