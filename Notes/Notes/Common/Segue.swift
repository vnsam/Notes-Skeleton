//
//  Segue.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation

enum Segue: String {
    case textNote = "identifier-for-note-detail-VC"
    case voiceNote = "identifier-for-voice-note-VC"
    case multimediaNote = "identifier-for-multimedia-note-VC"
    
    var identifier: String { return rawValue } // syntactic sugar
}

enum Cell: String {
    case text = "text-note-cell-identifier"
    case voice  = "voice-note-cell-identifier"
    case multimedia = "multimedia-note-cell-identifier"
    
    var identifier: String { return rawValue } // syntactic sugar
}
