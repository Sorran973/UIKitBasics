//
//  VCLifcycleVC.swift
//  UIKit Basic
//
//  Created by Artem Bulkhak on 26.05.2022.
//

import UIKit

class VCLifcycleVC: UIViewController {

    static let identifier = "2) VC Lifecycle"

    let button = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        print("init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    
//    override func loadView() {
//        print("loadView")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")

        title = "2) VC Lifecycle"
        view.backgroundColor = .purple
        
        view.addSubview(button)
        navigationController?.navigationBar.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("WillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        print("WillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("DidLayoutSubviews")
    }
    
    // ViewController is showed up
    
    override func viewDidAppear(_ animated: Bool) {
        // is called after ViewController pops up
        print("DidAppear")
    }
    
//    override func updateViewConstraints() {
//        print("updateViewConstraints")
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("WillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("DidDisappear")
    }
    

}
