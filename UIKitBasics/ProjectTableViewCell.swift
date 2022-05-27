//
//  ProjectTableViewCell.swift
//  UIKit Basic
//
//  Created by Artem Bulkhak on 26.05.2022.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    static let identifier = "ProjectTableViewCell"
    
    var projectLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ProjectTableViewCell {
    func setSubviews() {
        contentView.addSubview(projectLabel)
        projectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            projectLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            projectLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            projectLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            projectLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        projectLabel.backgroundColor = .yellow
        projectLabel.textColor = .black
        projectLabel.font = .boldSystemFont(ofSize: 40)
        projectLabel.textAlignment = .center
    }
}
