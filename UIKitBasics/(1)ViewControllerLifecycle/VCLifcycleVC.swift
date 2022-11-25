//
//  VCLifcycleVC.swift
//  UIKit Basic
//
//  Created by Artem Bulkhak on 26.05.2022.
//

import UIKit

class VCLifcycleVC: UIViewController {

    let button = UIButton()
    
    /**
     Next four methods are called one time in whole ViewController lifecycle
     */
    
    /**
     ----- (1) VC is unloaded in memory -----
     ----- Initialization way #1 -----
     ----- all outlets aren't set ------
     */
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)

        print("init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     ----- Initialization way #2 through Xib or Storyboard file -----
     ViewController is unloaded in memory, all outlets aren't set
     */
    override class func awakeFromNib() {
        super.awakeFromNib()

        print("awakeFromNib")
    }
    
    /**
     Initializing the view, allocation place in memory for ViewController. You can change properties and parameters of view
     All IBOutlets and IBAction are already set, but their frames might not be set (shouldn't use .bounds)
     */
    override func loadView() {
        super.loadView()
        title = "ViewController Lifecycle"
        view.backgroundColor = .systemPurple
        print("loadView")
    }
    
    
    /**
     Called after the controller's view is loaded into memory.
     View frame is not be set (shouldn't use .bounds)
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

//        title = "ViewController Lifecycle"
//        view.backgroundColor = .purple
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        button.addTarget(self, action: #selector(goToAnotherVC), for: .touchUpInside)
    }
    
    @objc func goToAnotherVC() {
        /**
         By using "NavigationController.pushViewController" main view disappear
         */
        navigationController?.pushViewController(AnotherVC(), animated: true)
        
        /**
         By just using "present(ViewController)" main view doesn't disappear, even if you use "modalPresentationStyle = .fullScreen"
         */
//        let anotherVC = AnotherVC()
//        anotherVC.modalPresentationStyle = .fullScreen
//        present(anotherVC, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /**
         
         All view outlets' frames are set and can be used for geometry work without animation
         Here you can fetch information from the internet such as URL
         */
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Button", for: .normal)
//        button.backgroundColor = .green
//        button.setTitleColor(.black, for: .normal)
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            button.heightAnchor.constraint(equalToConstant: 200)
//        ])
//
//        button.addTarget(self, action: #selector(goToAnotherVC), for: .touchUpInside)
        print("WillAppear")
    }
    
    /**
     All next three methods  are called always when constraints or frames are recalculated
     examples: 1) after WillAppear; 2) after WillDisappear; 3) any change of screen orientation
     */
    override func updateViewConstraints() {
        print("updateViewConstraints")
        super.updateViewConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        /**
         It is used for set subviews frames (if Autolayout isn't used)
         */
        print("WillLayoutSubviews")
    }
    // Autolayout is called
    override func viewDidLayoutSubviews() {
        print("DidLayoutSubviews")
    }
    //---------------------------------------------------------------
    
    /**
     This point of time the ViewController appears on the screen
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /**
         It is called immediately after ViewController pops up on the screen
         It is used for animation work; for FirstResponder to typing to a UITextView
         */
        print("DidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /**
         It can be used for clearing properties (UITextField); for stopping animation
         */
        print("WillDisappear")
    }
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /**
         Almost the same as viewWillDisappear, but changing colors of NavigationBar doesn't work
         */
        print("DidDisappear")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        /**
         It is called if lack of memory and kills the app
         Here you can try remove all unused elements or save data
         */
        print("DidReceiveMemoryWarning")
    }
    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        /**
         It is called for animation process after changing of screen orientation
         */
        print("WillTransition")
    }
}

/**
 When you try to partially swipe "AnotherVC" and come back "viewDidDisappear" won't be called
 */
