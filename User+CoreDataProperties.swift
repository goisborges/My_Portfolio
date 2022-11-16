//
//  User+CoreDataProperties.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-09-02.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension User : Identifiable {

}
