//
//  Note+CoreDataProperties.swift
//  ls37
//
//  Created by Isa Melsov on 15/12/23.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var details: String?
    @NSManaged public var date: String?

}

extension Note : Identifiable {

}
