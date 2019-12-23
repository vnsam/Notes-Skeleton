//
//  SimpleView.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class SimpleView: UIView {
    @IBOutlet var titleLabel: UILabel!
    
    init(frame: CGRect, title: String) { // programatically creating views. Could be loaded from XIB.
        super.init(frame: frame)
        
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
