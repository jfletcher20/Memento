//
//  TaskCard.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct TaskCardWidget: View {
    @State var task: Task;
    var body: some View {
        HStack {
            colorStrip();
            VStack(alignment: .leading) {
                Text(task.name)
                    .font(.body)
                Text(formatDate(task.dueDate))
                    .font(.footnote)
                    .foregroundColor(!task.completed && isOverdue(task.dueDate) ? .red : .secondary)
            }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(8)
        }.frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
    }
    
    func colorStrip(width: Double = 8) -> some View {
        return RoundedRectangle(cornerRadius: 8)
            .fill(task.category.color)
            .frame(width: width);
    }
    
    func isOverdue(_ dueDate: Date) -> Bool {
        return Date() > dueDate;
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter();
        formatter.dateStyle = .medium;
        return formatter.string(from: date);
    }
}

struct TaskCardWidget_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardWidget(task: Mock.getTasks().first!)
    }
}
