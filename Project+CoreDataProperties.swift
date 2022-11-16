//
//  Project+CoreDataProperties.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-09-02.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var projectName: String?
    @NSManaged public var projectLanguage: String?
    @NSManaged public var projectImage: Data?

}

extension Project : Identifiable {

}
