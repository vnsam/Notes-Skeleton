//
//  CoreDataManager.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager {
    
    init() {
        addNotificationObserver()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Notes")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        /*
         automaticallyMergesChangesFromParent - setting this to true,
         since `fetchObjects` function will always fetches in the background
         */
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()

    @objc func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchObjects<T: NSManagedObject>(fetchRequest: NSFetchRequest<NSFetchRequestResult>) -> [T] {
        /*
         1. Perform fetch in background and send fetched objects
         */
        
        /*
         let backgroundContext = persistentContainer.newBackgroundContext()
         taskContext.performAndWait {
            // fetch objects here
         }
         */
        
        return []
    }
    
    private func addNotificationObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(saveContext),
                                       name: UIApplication.willTerminateNotification,
                                       object: nil)

        notificationCenter.addObserver(self,
                                       selector: #selector(saveContext),
                                       name: UIApplication.didEnterBackgroundNotification,
                                       object: nil)
    }
}
