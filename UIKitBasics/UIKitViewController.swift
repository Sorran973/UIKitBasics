//
//  UIKitViewController.swift
//  UIKit Basic
//
//  Created by Artem Bulkhak on 26.05.2022.
//

import UIKit


class UIKitViewController: UITableViewController {
    
    var projectList = [UIViewController.Type]()
    let projectsNameList = ["1) VCLifecycle & Segue", "2) UIPickerView", "3) TabBar & NavBar", "4) Gesture Recognizer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink

        tableView.register(ProjectTableViewCell.self, forCellReuseIdentifier: ProjectTableViewCell.identifier)
        
        projectList.append(VCLifcycleVC.self)
        projectList.append(PickerVC.self)
        projectList.append(TabBarVC.self)
        projectList.append(GestureRecognizerVC.self)
        
        


    }
    

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectTableViewCell.identifier, for: indexPath) as! ProjectTableViewCell
        cell.projectLabel.text = projectsNameList[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerType = projectList[indexPath.row]
        if viewControllerType == TabBarVC.self {
            let vc = viewControllerType.init()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            navigationController?.pushViewController(viewControllerType.init(), animated: true)
        }
    }
}
