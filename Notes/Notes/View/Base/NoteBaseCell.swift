//
//  NoteBaseCell.swift
//  Notes
//
//  Created by Vignesh Narayanasamy on 2019-12-23.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class NoteBaseCell: UITableViewCell {
    @IBOutlet var noteContentStackView: UIStackView!
    @IBOutlet var noteDetailStackView: UIStackView!
    
    var noteContentStackViewSize: CGSize {
        return noteContentStackView.frame.size
    }
    
    var noteDetailStackViewSize: CGSize {
        return noteDetailStackView.frame.size
    }
    
    func setNoteContentView(_ view: UIView) {
        noteContentStackView.addArrangedSubview(view)
    }
    
    func setNoteDetailView(_ view: UIView) {
        noteDetailStackView.addArrangedSubview(view)
    }
    
    func setNoteDetailView(title: String, subTitle: String) {
        let detailFrame = CGRect(x: 0.0, y: 0.0, width: noteDetailStackViewSize.width, height: noteDetailStackViewSize.height)
        
        let noteDetailView = NoteDetailView(frame: detailFrame, title: title, subTitle: subTitle)
        setNoteDetailView(noteDetailView)
    }
}
