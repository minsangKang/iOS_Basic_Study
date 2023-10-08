//
//  Todo+CoreDataProperties.swift
//  Basic_CoreData
//
//  Created by Kang Minsang on 2023/10/08.
//
//

import Foundation
import CoreData

extension Todo {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var text: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var done: Bool
}

extension Todo : Identifiable {

}
