//
//  ContactsTableViewController.swift
//  MySchedule
//
//  Created by Полищук Александр on 30.08.2022.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let idContactsTaskCell = "idContactsTaskCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        title = "Contacts"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.separatorStyle = .none
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactsTaskCell)
        tableView.bounces = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(AddButtonTapped))
    }
    
    @objc func AddButtonTapped() {
        let contactOption = ContactOptionTableViewController()
        navigationController?.pushViewController(contactOption, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idContactsTaskCell, for: indexPath) as! ContactsTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("Tapped")
    }
}

