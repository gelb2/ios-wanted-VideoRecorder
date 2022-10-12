//
//  VideoCellContentView.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/11.
//

import UIKit

class VideoCellContentView: UIView {

    
    //input
    var didReceiveViewModel: (VideoCellContentViewModel) -> () = { viewModel in  }
    
    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension VideoCellContentView: Presentable {
    func initViewHierarchy() {
        
    }
    
    func configureView() {
        
    }
    
    func bind() {
        didReceiveViewModel = { [weak self] viewModel in
            guard let self = self else { return }
        }
    }
    
    
}
