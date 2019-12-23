//
//  ImageTextCell.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class ImageTextCell: UITableViewCell, CustomCell {
    @IBOutlet var noteImageView: UIImageView! // note contents
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var additionalInfoStackView: UIStackView! // date
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        /*... clear state*/
    }
    
    func set(viewModel: NoteCellViewModel) {
        /*... implement UI*/
        
        /*... based on `viewModel.displayMode` value getView from Custom cell and add it to additionalInfoStackView.*/
    }
}
