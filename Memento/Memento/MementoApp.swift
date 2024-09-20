//
//  MementoApp.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import SwiftUI

@main
struct MementoApp: App {
    @StateObject private var coreDataStack: CoreDataStack = CoreDataStack.shared;
    init() {
        CoreDataStack.initialize();
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataStack.persistent.viewContext)
        }
    }
}

struct MementoApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
