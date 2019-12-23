//
//  NoteCellViewModel.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation

struct NoteCellViewModel {
    let note: Note
    let displayMode: NoteDisplayMode
}

extension NoteCellViewModel {
    var title: String { return note.title! }
    var body: String { return note.body! }
    
    var createdDateAsString: String { return formatter.string(from: note.createdDate!) }
    var modifiedDateAsString: String { return formatter.string(from: note.modifiedDate!) }
    
    var noteTypeImageName: String {
        /*
         1. Determine the image to display for the attachment type (from URL).
         Example: display `pdf` icon for a PDF file.
         */
        
        return "icon-image-path"
    }
    
    // MARK: - Formatting
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter
    }
}
