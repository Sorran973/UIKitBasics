//
//  UIKitViewController.swift
//  UIKit Basic
//
//  Created by Artem Bulkhak on 26.05.2022.
//

import UIKit

class UIKitViewController: UITableViewController {

    enum NavigationState {
        case project(UIViewController.Type)
    }
    
    var projectList = [NavigationState]()
    let projectsNameList = ["1) VCLifecycle & Segue", "2) UIPickerView"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(ProjectTableViewCell.self, forCellReuseIdentifier: ProjectTableViewCell.identifier)
        
        view.backgroundColor = .systemPink
        
        projectList.append(.project(VCLifcycleVC.self))
        projectList.append(.project(PickerVC.self))
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
        let value = projectList[indexPath.row]
        switch value {
        case .project(let viewControllerType):
            navigationController?.pushViewController(viewControllerType.init(), animated: true)
        default:
            fatalError()
        }
    }
}
