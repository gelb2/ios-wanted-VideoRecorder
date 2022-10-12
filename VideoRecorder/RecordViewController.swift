////
////  RecordViewController.swift
////  VideoRecorder
////
////  Created by 1 on 2022/10/12.
////
//
//import UIKit
//import AVKit
//import MobileCoreServices
//import AVFoundation
//
//class RecordViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    var videoAndImageReview = UIImagePickerController()
//    var videoURL : URL?
//
//
//
//    let testButton = UIButton()
//    let testButton2 = UIButton()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        title = "2번"
//        buttontest()
//    }
//
//
//    func buttontest() {
//        testButton.setTitle("▶️▶️▶️", for: .normal)
//        testButton.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(testButton)
//        let safeArea = view.safeAreaLayoutGuide
//        testButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
//        testButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -350).isActive = true
//        testButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
//
//        testButton.addTarget(self, action: #selector(buttontest(_:)), for: .touchUpInside)
//
//        testButton2.setTitle("▶️▶️", for: .normal)
//        testButton2.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(testButton2)
//        let safeArea1 = view.safeAreaLayoutGuide
//        testButton2.leadingAnchor.constraint(equalTo: safeArea1.leadingAnchor, constant: 20).isActive = true
//        testButton2.bottomAnchor.constraint(equalTo: safeArea1.bottomAnchor, constant: -200).isActive = true
//        testButton2.trailingAnchor.constraint(equalTo: safeArea1.trailingAnchor, constant: -20).isActive = true
//
//        testButton2.addTarget(self, action: #selector(buttontest1(_:)), for: .touchUpInside)
//    }
//    
//    @objc func buttontest(_ sender: UIButton) {
//    }
//    @objc func buttontest1(_ sender: UIButton) {
//
//    }
//
//
//}
