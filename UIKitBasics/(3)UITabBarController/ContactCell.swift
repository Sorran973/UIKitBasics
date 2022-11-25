//
//  ContactTVCellTableViewCell.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 01.06.2022.
//

import UIKit

class ContactCell: UITableViewCell {

    static let identifier = "ContactCell"
    
    var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    var contactImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        
        addSubview(lastNameLabel)
        addSubview(firstNameLabel)
        addSubview(contactImageView)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            contactImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contactImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contactImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            contactImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.5/6),
            
            lastNameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 4.4/6),
            lastNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            lastNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            lastNameLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 2/3),
            
            firstNameLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor),
            firstNameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 4.4/6),
            firstNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            firstNameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
