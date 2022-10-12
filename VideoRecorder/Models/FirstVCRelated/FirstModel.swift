//
//  FirstModel.swift
//  VideoRecorder
//
//  Created by sokol on 2022/10/11.
//

import Foundation

class FirstModel {
    
    //input
    
    //output
    var firstContentViewModel: FirstContentViewModel {
        return _firstContentViewModel
    }
    
    //properties
    private var repository: RepositoryProtocol
    
    private var _firstContentViewModel: FirstContentViewModel
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        self._firstContentViewModel = FirstContentViewModel()
    }
}
