//
//  Memos+CoreDataProperties.swift
//  Memo
//
//  Created by K K on 2021/03/04.
//
//

import Foundation
import CoreData


extension Memos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memos> {
        return NSFetchRequest<Memos>(entityName: "Memos")
    }

    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    

}

extension Memos : Identifiable {

}
