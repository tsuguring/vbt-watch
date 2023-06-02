//
//  Persistence.swift
//  VBTwatch
//
//  Created by Ryo Yoshitsugu on R 5/05/20.
//

import CoreData


class PersistenceController: ObservableObject {
    let container = NSPersistentCloudKitContainer(name: "Training")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data faild to load: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}
