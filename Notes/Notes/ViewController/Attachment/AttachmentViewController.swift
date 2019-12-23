//
//  AttachmentViewController.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class AttachmentViewController: UIViewController {
    init(fileUrl: URL) {
        super.init(nibName: nil, bundle: nil) // implement nib name and bundle.
        /*
         1. Fetch the attachment and display it in the view.
         2. Based on the attachment type - disptach a new view.
         Example: if the attachment is a PDF - render a PDF viewer.
         */
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
