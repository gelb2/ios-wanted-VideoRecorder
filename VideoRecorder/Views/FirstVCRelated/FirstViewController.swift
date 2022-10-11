//
//  ViewController.swift
//  VideoRecorder
//
//  Created by kjs on 2022/10/07.
//

import UIKit

class FirstViewController: UIViewController {

    var model: FirstModel
    
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
    }
    
    func configureView() {
        
    }
    
    func bind() {
        
    }
    
    
}
