//
//  AnotherViewController.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 28.05.2022.
//

import UIKit

class AnotherVC: UIViewController {

    static let identifier = "AnotherVC"
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        print("init AnotherVC")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        /**
         Loading the view. You can change properties and parameters of view
         */
        title = "AnotherViewController"
        view.backgroundColor = .systemBlue
        navigationController?.navigationBar.tintColor = .black
        print("loadViewAnotherVC")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        /**
         It is called for elements from Storyboard or Xib
         Here outlets aren't set yet
         */
        print("awakeFromNibAnotherVC")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         It is called (one time in whole lifecycle) if ViewController doesn't exist earlier and allocates place in memory for VC
         All outlets are already set and exist, but their frames might not be set (shouldn't use .bounds)
         */
        print("viewDidLoadAnotherVC")
  
//        title = "AnotherViewController"
//        view.backgroundColor = .systemBlue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /**
         All view outlets' frames are set and can be used for geometry work without animation
         */
        print("WillAppearAnotherVC")
    }
    
    /**
     All next three methods  are called always when constraints or frames are recalculated
     examples: 1) after WillAppear; 2) after WillDisappear; 3) any change of screen orientation
     */
    override func updateViewConstraints() {
        print("updateViewConstraintsAnotherVC")
        super.updateViewConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        /**
         It is used for set subviews frames (if Autolayout isn't used)
         */
        print("WillLayoutSubviewsAnotherVC")
    }
    // Autolayout is called
    override func viewDidLayoutSubviews() {
        print("DidLayoutSubviewsAnotherVC")
    }
    //---------------------------------------------------------------
    
    /**
     This point of time the ViewController appears on the screen
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /**
         It is called immediately after ViewController pops up on the screen
         It is used for animation work, for FirstResponder to typing to a UITextView
         */
        print("DidAppearAnotherVC")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /**
         It can be used for clearing properties (UITextField), stop animation
         */
        navigationController?.navigationBar.tintColor = .systemBlue
        print("WillDisappearAnotherVC")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        /**
         Almost the same as viewWillDisappear
         */
        print("DidDisappearAnotherVC")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        /**
         It is called if lack of memory and kills the app
         Here you can try remove all unused elements and save data
         */
        print("DidReceiveMemoryWarningAnotherVC")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        /**
         It is called for animation process after changing of screen orientation
         */
        print("WillTransitionAnotherVC")
    }

}
