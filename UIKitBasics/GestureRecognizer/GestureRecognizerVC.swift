//
//  GestureRecognizerVC.swift
//  UIKitBasics
//
//  Created by Artem Bulkhak on 09.06.2022.
//

import UIKit


class Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

class Mamal: Animal {
    let numberOfLegs: String
    init?(numberOfLegs: String) {
        if numberOfLegs.isEmpty { return nil }
        self.numberOfLegs = numberOfLegs
        super.init(species: "species")
    }
}

class A {
    var a: Int
    
    init(a: Int) {
        self.a = a
    }
}

class B: A {
    var b: Int
    lazy var c = {
        return self.b + 100
    }()

    override init(a: Int) {
        self.b = 100
        super.init(a: a)
    }
//    init(a: Int, b: Int) {
//        self.b = b
//        super.init(a: a)
//        self.c = 200
//    }
}

class Node {
    var data: String?
    var next: Node?
    
    init(data: String, next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    deinit {
        print("Node \(self.data) is deinitialized")
    }
}

class SinglyLinkedList {
    var head: Node?
    var tail: Node?
    
    func append(value: String) {
        let node = Node(data: value)
        if head == nil {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    func append(node: Node) {
        if head == nil {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    deinit {
        print("LinkedList is deinitialized")
    }
}

class GestureRecognizerVC: UIViewController {
    
    var str: String?
    
    let button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let buttonTwo: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "Gesture Recognizer"
        navigationController?.navigationBar.tintColor = .green
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        
        configureUI()
        
        
        
        
        
        var b = B(a: 1)
        
//        var list: SinglyLinkedList? = SinglyLinkedList()
//        var node1 = Node(data: "1")
//        var node2 = Node(data: "2")
//        var node3 = Node(data: "3")
//        var node4 = Node(data: "4")
//        list?.append(node: node1)
//        list?.append(node: node2)
//        list?.append(node: node3)
//        list?.append(node: node4)
//        list?.append(value: "1")
//        list?.append(value: "2")
//        list?.append(value: "3")
//        list?.append(value: "4")
//        list?.head = nil
//        list?.tail = nil
//        list?.removeAll()
////        list = nil
//        print(list)
//        print(list?.tail)
        
        
//        let elementSix = Node(data: "6", next: nil)
//        let elementFive = Node(data: "5", next: elementSix)
////        let elementFive = MyList(data: "5", next: nil)
//        let elementFour = Node(data: "4", next: elementFive)
//        let elementTree = Node(data: "3", next: elementFour)
//        let elementTwo = Node(data: "2", next: elementTree)
//        let elementOne = Node(data: "1", next: elementTwo)
        
        
//        findMiddle(elementOne)
//        findNthFromEnd(elementOne, 6)
//        findNthFromEnd(elementOne, 5)
//        findNthFromEnd(elementOne, 4)
//        findNthFromEnd(elementOne, 3)
//        findNthFromEnd(elementOne, 2)
//        findNthFromEnd(elementOne, 1)
//        findNthFromEnd(elementOne, 0)
//        findNthFromEnd(elementOne, 10)
    }

    
    func findMiddle(_ node: Node) {
        var fast: Node? = node
        var slow: Node? = node
        
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        
        print(slow?.data)
    }
    
    func findNthFromEnd(_ head: Node?, _ nFromEnd: Int) {
        var first = head
        var second = head
        
        for _ in 0...nFromEnd {
            if second == nil {
                print("nil")
                return
            }
            second = second?.next
        }
        
        while second != nil {
            first = first?.next
            second = second?.next
        }
        print(first?.data)
//        var node = head
//        var count = 1
//        while let next = node.next {
//            node = next
//            count += 1
//        }
//        var t = count - nFromEnd - 1
//        if t < 0 || t > count {
//            return
//        } else {
//            node = head
//            while t > 0 {
//                node = node.next!
//                t -= 1
//            }
//            print(node.data!)
//        }

    }
    
//    func maxWord(_ element: MyList) -> String {
//        guard let max = element.data else { fatalError() }
//        var nextData = ""
//        if let next = element.next {
//            nextData = maxWord(next)
//        }
//        return max.count > nextData.count ? max : nextData
//    }
    
//    func maxWord(_ element: MyList) -> String {
//        guard var max = element.data else { fatalError() }
//        var next = element.next
//        while next != nil {
//            guard let nextData = next!.data else { fatalError() }
//            max = max.count > nextData.count ? max : nextData
//            next = next!.next
//        }
//        return max
//    }
    
    @objc func buttonHandler() {
        let vc = SecondViewController()
        vc.closure = { [weak self] name in
//            self?.str = name
            guard let mySelf = self else { fatalError() }
            print("before green: " + (mySelf.str ?? "nil"));
            mySelf.str = name
            print("after green: " + (mySelf.str ?? "nil"))
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonTwoHandler() {
        print("before red: " + (str ?? "nil"))
        str = "Paul"
        print("after red: " + (str ?? "default"))
    }
    
    private func configureUI() {
        view.addSubview(button)
        view.addSubview(buttonTwo)
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(buttonTwoHandler), for: .touchUpInside)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 150),
            
            buttonTwo.topAnchor.constraint(equalTo: button.bottomAnchor),
            buttonTwo.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            buttonTwo.widthAnchor.constraint(equalToConstant: 200),
            buttonTwo.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
