//
//  CoreData.swift
//  Memento
//
//  Created by Joshua Lee Fletcher
//

import Foundation
import CoreData
import SwiftUI

class CoreDataStack: ObservableObject {
    
    static let shared = CoreDataStack();
    lazy var persistent: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { _, error in
            if error != nil {
                fatalError("Failed to load persistent stores: \(error!.localizedDescription)")
            }
        }
        return container;
    }()
    
    private init() { }
    static func initialize() {
        let context = shared.persistent.viewContext;
        let fetch = TaskCategoryDataModel.fetchRequest();
        do {
            let condition: Bool = try context.count(for: fetch) == 0;
            if condition {
                let rampu = TaskCategoryDataModel(context: shared.persistent.viewContext);
                rampu.id = UUID();
                rampu.name = "RAMPU";
                rampu.color = Color.blue.description;
                let rpp = TaskCategoryDataModel(context: shared.persistent.viewContext);
                rpp.id = UUID();
                rpp.name = "RPP";
                rpp.color = Color.orange.description;
                let rwa = TaskCategoryDataModel(context: shared.persistent.viewContext);
                rwa.id = UUID();
                rwa.name = "RWA";
                rwa.color = Color.green.description;
                CoreDataStack.shared.commit();
            }
        } catch { }
    }
    
    func commit() {
        guard persistent.viewContext.hasChanges else { return; }
        do {
            try persistent.viewContext.save();
        } catch {
            print("ERROR: Couldn't save context: ", error.localizedDescription);
        }
    }
    
    func clear() {
        let entities = persistent.managedObjectModel.entities.map({ $0.name! })
        entities.forEach { [weak self] entity in
            let delete = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let deleteReq = NSBatchDeleteRequest(fetchRequest: delete);
            do {
                try? persistent.viewContext.execute(deleteReq);
                commit();
            }
        }
    }
    
    func delete(item: TaskDataModel) {
        persistent.viewContext.delete(item);
        commit();
    }
    
}
