//
//  NoteDisplayMode.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation

enum NoteDisplayMode {
    case simple
    case detail
    
    var toggledTitle: String { // This is used for displaying the title string of the add button.
        switch self {
        case .simple: return "Detail"
        case .detail: return "Simple"
        }
    }
    
    mutating func toggle() {
        switch self {
        case .simple: self = .detail
        case .detail: self = .simple
        }
    }
}
