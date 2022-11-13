//
//  List+CoreDataProperties.swift
//  Todo_List
//
//  Created by Ibrahim Khalilov on 2022-11-13.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var title: String?

}

extension List : Identifiable {

}
