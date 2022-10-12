//
//  firstViewController.swift
//  VideoRecorder
//
//  Created by 1 on 2022/10/12.
//

import UIKit

class firstViewController: UIViewController {
    
    let testButton = UIButton()
    
    lazy var rightNavButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "⌾", style: .plain, target: self, action: #selector(add))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "목록"
        self.navigationItem.rightBarButtonItem = self.rightNavButton
        labeltest()

    
    }
    
    @objc func add(_ sender: Any) {
                let firstView = ViewController() // 첫번째 화면 푸시
                self.navigationController?.pushViewController(firstView, animated: true)
    }
    
    func labeltest() {
        testButton.setTitle("▶️", for: .normal)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(testButton)
        let safeArea = view.safeAreaLayoutGuide
        testButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        testButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -220).isActive = true
        testButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        
        testButton.addTarget(self, action: #selector(buttontest(_:)), for: .touchUpInside)
    }
    
    @objc func buttontest(_ sender: UIButton) {
        let firstView = VideoPlayViewController() // 첫번째 화면 푸시
        self.navigationController?.pushViewController(firstView, animated: true)
        }
    
}
