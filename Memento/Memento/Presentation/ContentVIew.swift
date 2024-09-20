//
//  ContentView.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import AlertToast
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                PendingTasksView().tabItem {
                    Image(systemName: "list.number")
                    Text("PENDING")
                }
                CompletedTasksView().tabItem {
                    Image(systemName: "checkmark.rectangle")
                    Text("COMPLETE")
                }
                NewsView().tabItem {
                    Image(systemName: "doc")
                    Text("NEWS")
                }
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        HStack(alignment: .firstTextBaseline) {
                            Text("Memento").font(.headline)
                            Text("MTLAB@FOI").font(.subheadline)
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
