//
//  ViewController.swift
//  VideoRecorder
//
//  Created by kjs on 2022/10/07.
//

import UIKit

class FirstViewController: UIViewController {

    var model: FirstModel
    
    lazy var contentView: FirstContentView = FirstContentView(viewModel: self.model.firstContentViewModel)
    
    init(viewModel: FirstModel) {
        self.model = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        initViewHierarchy()
        configureView()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension FirstViewController: Presentable {
    func initViewHierarchy() {
        self.view = UIView()
        self.view.backgroundColor = .yellow
        
        self.view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ]
    }
    
    func configureView() {
        navigationItem.title = "목록"
        
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "〈", style: .plain, target: self, action:  #selector(back))
        
      
    }
    @objc func back() {
        let camera = UIImagePickerController()
        camera.delegate = self
        camera.sourceType = .camera
        camera.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera) ?? []
        camera.allowsEditing = false
        self.present(camera, animated: true)
//                let firstView = ViewController() // 첫번째 화면 푸시
//                self.navigationController?.pushViewController(firstView, animated: true)
    }
 
    
    func bind() {
        
    }
}

extension FirstViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //동영상 저장
        if let url = info[.mediaURL] as? URL, UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path) {
                    UISaveVideoAtPathToSavedPhotosAlbum(url.path, self, #selector(savedVideo), nil)
                }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func savedVideo(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo: UnsafeMutableRawPointer?) {
                if let error = error {
                    print(error)
                    return
                }
                print("success")
            }
    
}
