//
//  SecondViewController.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/13.
//

import UIKit

class SecondViewController: UIViewController, SecondViewControllerRoutable {

    var model: SecondModel
    
    var testButton = UIButton()
    
    init(viewModel: SecondModel) {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondViewController: Presentable {
    func initViewHierarchy() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        self.view.addSubview(testButton)
        
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            testButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            testButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
    }
    
    func configureView() {
        testButton.setTitle("테스트", for: .normal)
        testButton.setTitleColor(.blue, for: .normal)
    }
    
    func bind() {
        model.routeSubject = { [weak self] scene in
            guard let self = self else { return }
            self.route(to: scene)
        }
        
        testButton.addTarget(self, action: #selector(customAction), for: .touchUpInside)
    }
    
    @objc func customAction() {
        model.didReceiveDoneRecoding()
    }
}
