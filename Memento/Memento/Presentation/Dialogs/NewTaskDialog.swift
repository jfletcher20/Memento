//
//  NewTaskDialog.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct NewTaskDialog: View {
    
    // making use of native DismissAction via environment property wrapper
    @Environment(\.dismiss) var dismiss;
    @Environment(\.managedObjectContext) private var viewContext;
    
    var onNewTask: ((_ task: TaskDataModel) -> ())?;
    
    @FetchRequest(
        entity: TaskCategoryDataModel.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskCategoryDataModel.name, ascending: true)]
    ) var taskCategories: FetchedResults<TaskCategoryDataModel>
    
    @State var name: String = "New task";
    @State var category: TaskCategoryDataModel? = nil;
    @State var dueDate: Date = Date();
    
    @State private var validForm: Bool = false;
    @State private var categoryPickerEnabled: Bool = false;
    
    var body: some View {
        List {
            TextField("Task Name", text: $name).onChange(of: $name) { newValue in
                validForm = newValue.wrappedValue.count > 0 && ($category.wrappedValue?.name ?? "Default").count > 0;
            }
            Button("Category: \($category.wrappedValue?.name ?? "Default")") {
                categoryPickerEnabled = true;
            }.confirmationDialog("Task category", isPresented: $categoryPickerEnabled) {
                ForEach(taskCategories) { c in
                    Button(c.name ?? "Default", action: {
                        category = c;
                    }).foregroundColor($category.wrappedValue?.color?.toColor() ?? .black)
                }
            }.foregroundColor($category.wrappedValue?.color?.toColor() ?? .red)
            Text("Due Date")
            DatePicker("", selection: $dueDate)
            HStack {
                Spacer()
                Button("Save", action: {
                    let newTask = TaskDataModel(context: viewContext);
                    newTask.id = UUID();
                    newTask.name = name;
                    newTask.dueDate = dueDate;
                    newTask.category = category;
                    newTask.completed = false;
                    onNewTask != nil ? onNewTask.unsafelyUnwrapped(newTask) : nil;
                    dismiss();
                }).disabled($category.wrappedValue == nil)
                Spacer()
            }
            HStack {
                Spacer()
                Button("Cancel", action: {
                    dismiss();
                }).foregroundColor(.red)
                Spacer()
            }
        }.background(.white)
    }
}

extension Binding: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        return "\(lhs)" == "\(rhs)";
    }
    
}

extension String {
    func toColor() -> Color? {
        if(self == "blue") { return Color.blue; }
        if(self == "orange") { return Color.orange; }
        if(self == "red") { return Color.red; }
        if(self == "yellow") { return Color.yellow; }
        if(self == "green") { return Color.green; }
        let components = self.replacingOccurrences(of: "RGBA(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .split(separator: " ")
        guard components.count == 4 else {
            return nil;
        }
        guard let red = Double(components[0]), let green = Double(components[1]), let blue = Double(components[2]), let alpha = Double(components[3]) else {
            return nil
        }
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha);
    }
}

struct NewTaskDialog_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskDialog(onNewTask: nil)
    }
}
