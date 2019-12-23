//
//  CoreDataHelper.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    static func fetchRequest<T: NSManagedObject>(entityName: String,
                                                 sortDescriptors: [NSSortDescriptor]) -> NSFetchRequest<T> {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.sortDescriptors = sortDescriptors
        
        return fetchRequest
    }
}
