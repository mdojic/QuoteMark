//
//  Book+CoreDataProperties.swift
//  QuoteMark
//
//  Created by Milan Dojic on 10/7/16.
//  Copyright © 2016 Milan Dojic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Book {

    @NSManaged var author: String?
    @NSManaged var name: String?
    @NSManaged var quotes: NSSet?

}
