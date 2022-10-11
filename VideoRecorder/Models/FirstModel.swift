//
//  FirstModel.swift
//  VideoRecorder
//
//  Created by sokol on 2022/10/11.
//

import Foundation

class FirstModel {
    
    private var repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
}
