//
//  ImageNoteContentView.swift
//  Notes
//
//  Created by Vignesh Narayanasamy on 2019-12-23.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class ImageNoteContentView: UIView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteImageView: UIImageView! // note contents
    
    init(frame: CGRect, title: String, image: UIImage? = UIImage(named: "placeholder-image-name")) {  // frame parameter could be skipped if we initialize from XIB.
        super.init(frame: frame)
        
        titleLabel.text = title
        noteImageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
