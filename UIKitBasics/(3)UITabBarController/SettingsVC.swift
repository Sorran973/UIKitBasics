//
//  SettingsVC.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 02.06.2022.
//

import UIKit

struct Setting {
    var image: UIImage?
    var text: String?
}

class SettingsVC: UIViewController {
    
    private let tableView: UITableView = {
       let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .black
        return tv
    }()
    
    private let hideSearchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "Search"
        sb.searchTextField.textColor = .green // text
        sb.tintColor = .green // cursor, cancelButton
//        sb.barTintColor = .black // background
        sb.autocorrectionType = UITextAutocorrectionType.no
        return sb
    }()
    
    private let _searchController = UISearchController()
    
    private let settingsList = [
        [Setting(image: UIImage(systemName: "airplane"), text: "Airplain mode"),
        Setting(image: UIImage(systemName: "wifi"), text: "Wi-Fi"),
        Setting(image: UIImage(systemName: "antenna.radiowaves.left.and.right"), text: "Mobile communication"),
        Setting(image: UIImage(systemName: "personalhotspot"), text: "Modem mode")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMainView()
        configureUI()
    }
    
    func configureMainView() {
        view.backgroundColor = .black
        title = tabBarController?.tabBar.items?[1].title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        navigationController?.navigationBar.tintColor = .green
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showHideSearchBar))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        
        hideSearchBar.sizeToFit()
        hideSearchBar.delegate = self
        
        navigationItem.searchController = _searchController
//        navigationItem.searchController?.searchBar.hi
        
//        var array1 = [1,2,3,4]
//        var array2 = [5,5,5,3]
//        print(combineArrays(arr1: array1, arr2: array2) {
//            $0 * $1
//        })
        var array1 = [5,14,77,12]
        var array2 = [1,5,3,13]
        combineArrays(array1,array2) {
            return max($0,$1)
        }
        
    }
        
        
    func combineArrays(_ arr1: [Int], _ arr2: [Int], closure: (Int, Int) -> Int) -> [Int] {
        var result = [Int]()
        for i in 0..<arr1.count {
            result.append(closure(arr1[i], arr2[i]))
        }
        print(result)
        return result
    }

    
    @objc func handleBack() {
        self.dismiss(animated: true)
    }
    
    @objc func showHideSearchBar() {
        navigationItem.titleView = hideSearchBar
        hideSearchBar.becomeFirstResponder()
        hideSearchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as? SettingCell else {return UITableViewCell()}
        
        let set = settingsList[indexPath.section][indexPath.row]
        cell.settingLabel.text = set.text
        cell.settingImageView.image = set.image
        
        return cell
    }
}

extension SettingsVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        hideSearchBar.showsCancelButton = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showHideSearchBar))
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
}

extension SettingsVC {
    func configureUI() {
        view.addSubview(tableView)
//        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
//            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
