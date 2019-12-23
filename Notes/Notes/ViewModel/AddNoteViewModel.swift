//
//  AddNoteViewModel.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation
import CoreData

class AddNoteViewModel {
    var mode: NoteDetailViewMode = .addOrEdit
    
    private let managedObjectContext: NSManagedObjectContext
    private var note: Note!
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    var title: String {
        return "New Note"
    }
    
    func addNote(title: String, body: String, attachments: [Attachment]? = nil) {
        note = Note(context: managedObjectContext)
        note.title = title
        note.body = body
        note.attachments = NSSet(array: attachments!)
        
        note.createdDate = Date()
        note.modifiedDate = Date() // at the time of creation - both created and modified would have a least difference in milliseconds.
    }
    
    /*
        ... could also add capability for updating a note in the future
     */
    
    func setAttachments(at urls: [URL]) {
        /*
         1. If at this point self.note is not created validate this here.
         2. Create note (if needed) and append attachments.
         */
        let attachments = urls.map {[weak self] (url) -> Attachment in
            let attachment = Attachment(context: self!.managedObjectContext)
            attachment.fileUrl = url.absoluteString
            return attachment
        }
        
        /*... all the content validation here.*/
        note.attachments = NSSet(array: attachments)
    }
}
