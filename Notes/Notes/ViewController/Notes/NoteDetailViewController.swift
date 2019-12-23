//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var bodyTextView: UITextView!
    @IBOutlet var attachmentsTableView: UITableView! // list of all attachments added earlier. Datasource is note.attachments - no implementation.
    
    var viewModel: AddNoteViewModel! // must need this view model, since the core functionality of this VC is to get inputs for a Note object.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*... all the UI customization call site.*/
        title = viewModel.title
        
        setDetailViewModeUI()
    }
    
    // MARK: - UI Action
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        lockEditing()
        
        let title = titleTextField.text
        let body = bodyTextView.text
        
        /*... all the content validation here.*/

        viewModel.addNote(title: title!, body: body!)
        
        /*... by this time a `NSFetchedResultsControllerDelegate` will be triggered by Core Data. */
        
        /* Navigate to previous screen here if needed. */
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem) {
        unlockEditing()
    }
    
    @IBAction func selectAttachmentButtonTapped(sender: UIButton) {
        /*
         1. Launch UIDocumentPickerViewController.
         2. Listen to the - didPickDocumentsAt urls: [URL]) delegate call back.
         3. Create attachment objects for the note.
         4. Add it to note.
         */
    }
    
    private func setDetailViewModeUI() {
        viewModel.mode == .addOrEdit ? unlockEditing() : lockEditing()
    }
    
    private func lockEditing() {
        /*
         1. Toggle the style for titleTextField and bodyTextView apperance to match read-only design.
         2. Disable editing.
         3. Disable select attachment button.
         */
    }
    
    private func unlockEditing() {
        /*
        1. Toggle the style for titleTextField and bodyTextView apperance to match read-only design
        2. Enable editing.
        3. Enable select attachment button.
        */
    }
}

extension NoteDetailViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        viewModel.setAttachments(at: urls)
    }
}

extension NoteDetailViewController: UITableViewDelegate {
    // attachmentsTableView - selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
         1. Present a new view controller with attach
         */
    }
}
