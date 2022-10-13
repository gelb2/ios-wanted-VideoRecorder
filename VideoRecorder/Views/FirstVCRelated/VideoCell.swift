//
//  VideoCell.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/11.
//

import UIKit

class VideoCell: UITableViewCell, VideoCellContentViewStyle {

    lazy var cellView = VideoCellContentView()
    
    var viewModel: VideoCellContentViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            cellView.didReceiveViewModel(viewModel)
        }
    }
    var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViewHierarchy()
        configureView()
        bind()
        addSubview(nameLabel)
        configure()
    }
    func configure() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(viewModel: VideoCellContentViewModel) {
        self.viewModel = viewModel
    }
    
    

}

extension VideoCell: Presentable {
    func initViewHierarchy() {
        
        self.contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
    }
    
    func configureView() {
        
    }
    
    func bind() {
        
    }
    
    
}
