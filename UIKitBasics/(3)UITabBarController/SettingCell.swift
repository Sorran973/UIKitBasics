//
//  SettingCell.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 04.06.2022.
//

import UIKit

class SettingCell: UITableViewCell {

    static let identifier = "SettingCell"
    
    let settingImageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .black
        return iv
    }()
    
    let settingLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.addSubview(settingImageView)
        contentView.addSubview(settingLabel)
        
        NSLayoutConstraint.activate([
            settingImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            settingImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            settingImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.5/6),
            
            settingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            settingLabel.leadingAnchor.constraint(equalTo: settingImageView.trailingAnchor),
            settingLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
