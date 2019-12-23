//
//  NotesViewModel.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation
import CoreData

class NotesViewModel: NSObject {
    private var coreDataManager = CoreDataManager()
    
    private lazy var fetchedResultsController: NSFetchedResultsController<Note> = {
        let entityName = String(describing: Note.self)
        let sortDescriptors: [NSSortDescriptor] = [] // implement
        let fetchRequest: NSFetchRequest<Note> = CoreDataHelper.fetchRequest(entityName: entityName,
                                                       sortDescriptors: sortDescriptors)
        let context = coreDataManager.persistentContainer.viewContext // assuming only one persistent container
        
        let controller = NSFetchedResultsController<Note>(fetchRequest: fetchRequest, managedObjectContext: context,
                                                    sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            fatalError("Unresolved error \(error)")
        }
        
        return controller
    }()
    
    private(set) var displayMode = NoteDisplayMode.simple
}

extension NotesViewModel {
    // MARK: - List support
    var numberOfSections: Int {
        guard let sections = fetchedResultsController.sections else { return 0 }
        
        return sections.count
    }
    
    func numberOfRows(forSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        
        return section.numberOfObjects
    }
    
    func note(at indexPath: IndexPath) -> Note {
        return fetchedResultsController.object(at: indexPath)
    }
    
    func cellViewModel(at indexPath: IndexPath) -> NoteCellViewModel {
        let note = fetchedResultsController.object(at: indexPath)
        return NoteCellViewModel(note: note, displayMode: displayMode)
    }
    
    func addNoteViewModel() -> AddNoteViewModel {
        return AddNoteViewModel(managedObjectContext: fetchedResultsController.managedObjectContext)
    }
    
    func segue(forSelectedIndexPath indexPath: IndexPath) -> Segue {
        let note = fetchedResultsController.object(at: indexPath)
        let noteType = note.type
        
        switch noteType {
        case .text: return Segue.textNote
        case .voice: return Segue.voiceNote
        case .multimedia: return Segue.multimediaNote
        }
    }
    
    // MARK: - Display
    func toggleDisplayMode() {
        displayMode.toggle()
    }
}

extension NotesViewModel: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        /* Begin sending table view updates */
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        /* End sending table view updates */
    }
}
