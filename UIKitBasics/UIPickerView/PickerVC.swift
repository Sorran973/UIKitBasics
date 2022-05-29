//
//  PickerVC.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 29.05.2022.
//

import UIKit

class PickerVC: UIViewController {

    var pickerView = UIPickerView()
    var imageView = UIImageView()
    let universeList = ["Marvel", "DC"]
    let marvelHeroesList = ["Iron Man", "Captain America", "Thor"]
    let dcHeroesList = ["Superman", "Batman", "Wonderwoman", "Aquaman"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(pickerView)
        view.addSubview(imageView)
        pickerView.dataSource = self
        pickerView.delegate = self
        setSubviews()
        
    }
}

extension PickerVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return universeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return universeList.count
        } else {
            return pickerView.selectedRow(inComponent: 0) == 0 ? marvelHeroesList.count : dcHeroesList.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return universeList[row]
        } else {
            return pickerView.selectedRow(inComponent: 0) == 0 ? marvelHeroesList[row] : dcHeroesList[row]
        }
    }
}

extension PickerVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: false)
            if pickerView.selectedRow(inComponent: 0) == 0 {
                setImage(pictureName: marvelHeroesList[pickerView.selectedRow(inComponent: 1)])
            } else {
                setImage(pictureName: dcHeroesList[pickerView.selectedRow(inComponent: 1)])
            }
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                setImage(pictureName: marvelHeroesList[pickerView.selectedRow(inComponent: 1)])
            } else {
                setImage(pictureName: dcHeroesList[pickerView.selectedRow(inComponent: 1)])
            }
        }
    }
}

extension PickerVC {
    
    func setSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        setImage(pictureName: marvelHeroesList[0])
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 2/3),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pickerView.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
    
    func setImage(pictureName: String) {
        guard let image = UIImage(named: pictureName) else {return}
        imageView.image = image
    }
}
