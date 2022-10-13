//
//  ContentView.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/11.
//

import UIKit

class FirstContentView: UIView {
    
    var viewModel: FirstContentViewModel
    
    var tableView = UITableView()
    
    var reuseIdentifier = "VideoCell"
    
    init(viewModel: FirstContentViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FirstContentView: Presentable {
    func initViewHierarchy() {
        
        self.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
    }
    
    func configureView() {
        
    }
    
    func bind() {
        tableView.register(VideoCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension FirstContentView: UITableViewDelegate {
    
}

extension FirstContentView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? VideoCell else { fatalError() }
        
        return cell
    }
    
    
}
