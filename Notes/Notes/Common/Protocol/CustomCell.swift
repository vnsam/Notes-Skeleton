//
//  CustomCell.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

protocol CustomCell: UITableViewCell {
    func set(viewModel: NoteCellViewModel)
}

extension CustomCell {
    private func getView(with viewModel: NoteCellViewModel) -> UIView {
        let bounds = contentView.bounds
        let displayFrame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        
        let noteDetailView = NoteDetailView(frame: displayFrame, title: viewModel.createdDateAsString,
                                            subTitle: viewModel.modifiedDateAsString)
        return noteDetailView
    }
}
