//
//  ListController.swift
//  testToDoList
//
//  Created by Admin on 10/07/2019.
//  Copyright © 2019 musamuss. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NoteCell"

class ListController: UITableViewController {
    
    // MARK: - Properties
    
    var notes = [Note]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        configureList()
    }
    
    // MARK: - Helper Functions
    
    func configureList() {
    let list1 = Note(mainTitle: "School", DoImage: #imageLiteral(resourceName: "heart_blue"), wellDone: "15 done", isEdit: false)
   let list2 = Note(mainTitle: "Home", DoImage: #imageLiteral(resourceName: "heart_blue"), wellDone: "36 done", isEdit: false)
   let list3 = Note(mainTitle: "Art", DoImage: #imageLiteral(resourceName: "heart_blue"), wellDone: "45 done", isEdit: false)

        notes.append(list1)
        notes.append(list2)
        notes.append(list3)
        
    }
    
    func configureUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Lists"
        navigationController?.navigationBar.barTintColor = .white
    }
    
    func configureTableView() {
        tableView.register(NoteCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80
    }
    
}

extension ListController {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NoteCell
        cell.note = notes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(notes[indexPath.row].isEdit)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.notes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let actionTitle = notes[indexPath.row].isEdit ? "UnEdit" : "Edit"
        
        let favoriteAction = UITableViewRowAction(style: .normal, title: actionTitle) { (action, indexPath) in
            var user = self.notes[indexPath.row]
            user.isEdit.toggle()

            let cell = tableView.cellForRow(at: indexPath) as! NoteCell
           // self.notes[indexPath.row] = notes
          //  cell.note = note
        }
        
        favoriteAction.backgroundColor = UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)

        return [deleteAction, favoriteAction]
   }
    
}
