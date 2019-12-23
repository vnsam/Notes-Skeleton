//
//  VoiceNoteContentView.swift
//  Notes
//
//  Created by Vignesh Narayanasamy on 2019-12-23.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class VoiceNoteContentView: UIView {
    @IBOutlet var playNoteButton: UIButton! // Play note directly from cell.
    @IBOutlet var progressBar: UIProgressView! // To show the length of the note played.
    
    /*
     ... implementation
     Play button action and button delegate here.
     Implementing object should have reference to the note object with media URL.
     */
    
    init(frame: CGRect, mediaUrl: URL) {
        super.init(frame: frame)
        
        /*... forward URL to audio player instance.*/
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
