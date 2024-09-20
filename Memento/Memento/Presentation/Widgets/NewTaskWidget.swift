//
//  NewTaskWidget.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

struct NewTaskWidget: View {
    
    var onNewTask: ((_ task: Task) -> ())?;
    @State var showCreateTaskDialog: Bool = false;
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showCreateTaskDialog = true;
                }) {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }.padding(8)
            }
        }.sheet(isPresented: $showCreateTaskDialog) {
            NewTaskDialog(onNewTask: onNewTask)
        }
        
        // To create a custom dialog, place a ZStack around the VStack and may this if statement
        // be the final statement in the ZStack
        
//            if showCreateTaskDialog {
//                Color.black.opacity(0.3).ignoresSafeArea().onTapGesture {
//                    showCreateTaskDialog = false;
//                }
//                    .frame(width: 300, height: 350)
//                    .cornerRadius(20)
//                    .shadow(radius: 10)
//                    .transition(.move(edge: .bottom))
//                    .animation(.easeInOut)
//                    .navigationBarTitle("New task")
//
//            }
        
    }
}

struct NewTaskWidget_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskWidget()
    }
}
