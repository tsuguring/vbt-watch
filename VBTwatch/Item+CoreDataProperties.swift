//
//  Item+CoreDataProperties.swift
//  VBTwatch
//
//  Created by Ryo Yoshitsugu on R 5/05/20.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var velocity: Double

}

extension Item : Identifiable {

}
