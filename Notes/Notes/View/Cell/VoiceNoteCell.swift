//
//  VoiceNoteCell.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class VoiceNoteCell: NoteBaseCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        
        /*... clear state*/
    }
    
    func set(viewModel: NoteCellViewModel) {
        let contentFrame = CGRect(x: 0.0, y: 0.0, width: noteContentStackViewSize.width,
                                  height: noteContentStackViewSize.height) // frame is implemented in the call site here since this gives more flexibility to adjust x,y if need be.
        
        let noteContentView = VoiceNoteContentView(frame: contentFrame, mediaUrl: viewModel.voiceNoteUrl)
        setNoteContentView(noteContentView)
        
        guard viewModel.displayMode == .detail else {
            return
        }
        
        setNoteDetailView(title: viewModel.modifiedDateAsString, subTitle: viewModel.createdDateAsString)
    }
}
