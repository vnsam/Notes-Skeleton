//
//  TextNoteContentView.swift
//  Notes
//
//  Created by Vignesh Narayanasamy on 2019-12-23.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class TextNoteContentView: UIView {
    @IBOutlet var titleLabel: UILabel!
    
    /*... all view customization here*/
    
    init(frame: CGRect, title: String) { // frame parameter could be skipped if we initialize from XIB.
        super.init(frame: frame)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
