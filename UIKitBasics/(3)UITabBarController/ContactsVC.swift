//
//  ContactsVCViewController.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 01.06.2022.
//

import UIKit

struct Contact {
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var image: UIImage?
}

class First {
    let first: Int?
    var second: Int?
    
    init() {
        self.first = 1
    }
}

class ContactsVC: UITableViewController {

    var contactsList = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = tabBarController?.tabBar.items?[0].title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        navigationController?.navigationBar.tintColor = .green
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus", withConfiguration: .none), style: .plain, target: self, action: #selector(handlePlus))
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack)), animated: false)
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.identifier)
        
        
        contactsList.append(Contact(firstName: "Ivan", lastName: "Ivanov", phoneNumber: "89249328382", image: UIImage(systemName: "person")))
        contactsList.append(Contact(firstName: "Petr", lastName: "Glebov", phoneNumber: "89275322471", image: UIImage(systemName: "person")))
    
    }
    
    
    @objc func handlePlus() {
        let vc = NewContactVC()
        vc.addNewContactDelegate = self
        present(vc, animated: true)
    }
    
    @objc func handleBack() {
        self.dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as? ContactCell
        cell?.firstNameLabel.text = contactsList[indexPath.row].firstName
        cell?.lastNameLabel.text = contactsList[indexPath.row].lastName
        cell?.contactImageView.image = contactsList[indexPath.row].image
        
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let describeAlert = UIAlertController(title: "Profile", message: "", preferredStyle: .alert)
        let selectedContact = contactsList[indexPath.row]

        describeAlert.message = "First Name: \(selectedContact.firstName ?? "default")\nLast Name: \(selectedContact.lastName!)\nPhone Number: \(selectedContact.phoneNumber!)"
        describeAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(describeAlert, animated: true)
    }
}


extension ContactsVC: AddNewContactDelegate {
    
    func addNewContact(newContact: Contact) {
//        self.dismiss(animated: true) {
            self.contactsList.append(newContact)
            self.tableView.reloadData()
//        }
    }
}
