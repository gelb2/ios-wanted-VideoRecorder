//
//  VideoCellContentView.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/11.
//

import UIKit
import SwiftUI

class VideoCellContentView: UIView {

    var thumbNailImageView: UIImageView = UIImageView()
    var timeLabel: UILabel = UILabel()
    
    var nameLabel: UILabel = UILabel()
    var dateLabel: UILabel = UILabel()
    
    var detailButton = UIButton()
    var disclosureButton = UIButton()
    
    
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
        self.addSubview(thumbNailImageView)
        self.addSubview(nameLabel)
        self.addSubview(timeLabel)
        self.addSubview(detailButton)
        self.addSubview(disclosureButton)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraints: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            thumbNailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            thumbNailImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 8),
            thumbNailImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            thumbNailImageView.widthAnchor.constraint(equalToConstant: 64),
            thumbNailImageView.heightAnchor.constraint(equalTo: thumbNailImageView.widthAnchor)
        ]
        
        constraints += [
            nameLabel.bottomAnchor.constraint(equalTo: thumbNailImageView.centerYAnchor, constant: -4),
            nameLabel.leadingAnchor.constraint(equalTo: thumbNailImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: detailButton.leadingAnchor, constant: -8)
        ]
        
        constraints += [
            dateLabel.topAnchor.constraint(equalTo: thumbNailImageView.centerYAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: thumbNailImageView.trailingAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: detailButton.leadingAnchor, constant: -8)
        ]
        
        constraints += [
            detailButton.centerYAnchor.constraint(equalTo: thumbNailImageView.centerYAnchor),
            detailButton.widthAnchor.constraint(equalToConstant: 24),
            detailButton.heightAnchor.constraint(equalTo: detailButton.widthAnchor),
            detailButton.trailingAnchor.constraint(equalTo: disclosureButton.leadingAnchor, constant: -8)
        ]
        
        constraints += [
            disclosureButton.centerYAnchor.constraint(equalTo: detailButton.centerYAnchor),
            disclosureButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            disclosureButton.widthAnchor.constraint(equalToConstant: 24),
            disclosureButton.heightAnchor.constraint(equalTo: disclosureButton.widthAnchor)
        ]
    }
    
    func configureView() {
        
    }
    
    func bind() {
        didReceiveViewModel = { [weak self] viewModel in
            guard let self = self else { return }
        }
    }
    
    
}


#if canImport(SwiftUI) && DEBUG
struct VideoCellContentViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
       view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#endif


#if canImport(SwiftUI) && DEBUG

struct VideoCellContentViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        VideoCellContentViewPreview {
            let view = VideoCellContentView()
            return view
        }.previewLayout(.fixed(width: 320, height: 140))
    }
}

#endif
