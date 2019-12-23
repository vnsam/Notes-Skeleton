//
//  IconMapper.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import Foundation

enum NoteTypeIconMap: String {
    case pdf
    case txt
    case mp4
    case gif
    
    var iconName: String {
        /*
         1. Determine the correct icon to pick from assets.
         */
        return "icon-name-here"
    }
}
