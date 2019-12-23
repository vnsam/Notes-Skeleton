//
//  DetailView.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class DetailView: UIView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var createdDateLabel: UILabel!
    @IBOutlet var modifiedDateLabel: UILabel!
    
    init(frame: CGRect, title: String, body: String, createdAt: String, modifiedAt: String) {  // programatically creating views. Could be loaded from XIB.
        super.init(frame: frame)
        
        titleLabel.text = title
        bodyLabel.text = body
        createdDateLabel.text = createdAt
        modifiedDateLabel.text = modifiedAt
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
