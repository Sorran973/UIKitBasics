//
//  NewContactViewController.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 02.06.2022.
//

import UIKit

protocol AddNewContactDelegate {
    func addNewContact(newContact: Contact)
}

class NewContactVC: UIViewController {

    var addNewContactDelegate: AddNewContactDelegate?

    let navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    let navItem: UINavigationItem = {
       let navItem = UINavigationItem(title: "New contact")
        return navItem
    }()
    
    let firstNameTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .white
        tf.autocorrectionType = .no
        tf.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }()
    
    let lastNameTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .white
        tf.autocorrectionType = .no
        tf.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }()
    
    let phoneNumberTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .white
        tf.autocorrectionType = .no
        tf.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }()
    
    let contactImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "person")
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
    

    override func viewWillLayoutSubviews() {
        configureNavBar()
        configureSubviews()
    }
    
    func configureNavBar() {
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(handleDone))
        navItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(handleCancel))
        navBar.setItems([navItem], animated: false)
    }
    
    @objc func handleDone() {
        let newContact = Contact(firstName: firstNameTextField.text, lastName: lastNameTextField.text, phoneNumber: phoneNumberTextField.text, image: UIImage(systemName: "person"))
        
        addNewContactDelegate?.addNewContact(newContact: newContact)
        self.dismiss(animated: true)
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true)
    }
    
    func configureSubviews() {
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(contactImageView)
        view.addSubview(navBar)
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 65),
            
            contactImageView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            contactImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contactImageView.widthAnchor.constraint(equalToConstant: 100),
            contactImageView.heightAnchor.constraint(equalToConstant: 100),
            
            lastNameTextField.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            lastNameTextField.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor),
            lastNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            lastNameTextField.heightAnchor.constraint(equalTo: contactImageView.heightAnchor, multiplier: 1/2),
            
            firstNameTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor),
            firstNameTextField.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            firstNameTextField.heightAnchor.constraint(equalTo: contactImageView.heightAnchor, multiplier: 1/2),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor),
            phoneNumberTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            phoneNumberTextField.heightAnchor.constraint(equalTo: contactImageView.heightAnchor, multiplier: 1/2)
        ])
        
    }
}
