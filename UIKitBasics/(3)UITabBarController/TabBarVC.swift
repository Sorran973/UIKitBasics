//
//  TabBarVC.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 30.05.2022.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        tabBar.tintColor = .green
        tabBar.unselectedItemTintColor = .gray


        var vcList = [UIViewController]()
        vcList.append(UINavigationController(rootViewController: ContactsVC()))
        vcList.append(UINavigationController(rootViewController: SettingsVC()))
        
        self.setViewControllers(vcList, animated: true)
        
        
        // MARK: - ToDo through closures
        
        let tabBatItemSymbolList = ["person.crop.circle", "gear"]
        let tabBatItemTitleList = ["Contacts", "Settings"]
        let items = self.tabBar.items!
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: tabBatItemSymbolList[i])
            items[i].title = tabBatItemTitleList[i]
        }
        
        var number = 100
        let closure = { [number] in print(number)}
        print(number)
        closure()
        print(number)
        number += 1
        print(number)
        closure()
        print(number)
    }
    
    func hp(_ arr: [Int]) {
    }

    
}


