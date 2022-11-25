//
//  SecondViewController.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 12.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    deinit {
        print("SrcondVC is deinitialized")
    }
    
    var closure: ((String) -> Void)?

    let button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "Gesture Recognizer"
        navigationController?.navigationBar.tintColor = .green
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        
        configureUI()
    }
    
    @objc func buttonHandler() {
        guard let closure = closure else {
            return
        }
        closure("Jack")
        navigationController?.popViewController(animated: true)
    }

    private func configureUI() {
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

}
