//
//  NotesViewController.swift
//  Notes
//
//  Created by Uma on 2019-12-21.
//  Copyright © 2019 DispatchQ. All rights reserved.
//

import UIKit

class NotesViewController: UITableViewController {

    var viewModel = NotesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI Action
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        /*
         1. Navigate to add note view controller
         */
        performSegue(withIdentifier: Segue.textNote.identifier, sender: nil)
    }
    
    @IBAction func changeDisplayModeButtonTapped(sender: UIBarButtonItem) {
        /*
         1. Set toggled title in the button.
         2. Toggle display mode title in view controller ==> | Simple/Detail |.
         3. Refresh list here.
         */
        
        viewModel.toggleDisplayMode()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(forSection: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteType = viewModel.note(at: indexPath).type
        
        guard let cell = cellFor(noteType: noteType, tableView: tableView, cellForRowAt: indexPath) else {
            fatalError("Unable to get cell for the given identifier.")
        }
        
        return cell
    }
    
    /*
     ...cellViewModel will have the displayMode information.
     Based on this setting - we'll toggle the detailContentView in all types of cell.
     To avoid layout issues, we'll use stack view.
     
     Data-flow: current view controller's view model will hold the `displayMode` -> this is passed along to cellViewModel.
     
     On the cell the cell will decide to paint the detail view based on the displayMode sent.
     */
    private func cellFor(noteType: NoteType, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> NoteBaseCell? {
        let cellViewModel = viewModel.cellViewModel(at: indexPath)
        
        switch noteType {
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.text.identifier, for: indexPath) as? TextNoteCell
            cell?.set(viewModel: cellViewModel)
            return cell
        case .voice:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.voice.identifier, for: indexPath) as? VoiceNoteCell
            cell?.set(viewModel: cellViewModel)
            return cell
        case .multimedia:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.multimedia.identifier, for: indexPath) as? ImageTextCell
            cell?.set(viewModel: cellViewModel)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segue = viewModel.segue(forSelectedIndexPath: indexPath)
        
        performSegue(withIdentifier: segue.identifier, sender: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let segueIdentifier = Segue(rawValue: identifier) else { return }
        
        switch segueIdentifier {
        case .textNote:
            guard let destination = segue.destination as? NoteDetailViewController else { return }
            
            let addNoteViewModel = viewModel.addNoteViewModel()            
            destination.viewModel = addNoteViewModel
        case .voiceNote:
            guard let destination = segue.destination as? VoiceNoteViewController else { return }
            
            /*
             1. Perform all setup related to VoiceNoteViewController view model.
             */
        case .multimediaNote:
            guard let destination = segue.destination as? MultimediaNoteViewController else { return }
            
            /*
             1. Perform all setup related to MultimediaNoteViewController view model.
             */
        }
    }

}
