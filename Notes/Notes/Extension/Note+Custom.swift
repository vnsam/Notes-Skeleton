//
//  Note+Custom.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation

enum NoteType {
    case text
    case voice
    case multimedia
}

/*
 Assumption: A note can have one or more attachments.
 */

extension Note {
    var type: NoteType {
        /*
         1. For voice and multimedia notes - the attachments will NOT be empty.
         2. For text only note the attchments will be EMPTY.
         3. Check for note type based on attachments and MIME type.
         4. For all the audio extensions (like - m4a, mp3, wav etch) send the note type as voice.
         5. For everything else send multimedia type.
         */
        guard let  _ = self.attachments else {
            return .text
        }
        
        return .multimedia // implement. Read attachments Set and decide return type here.
    }
}
