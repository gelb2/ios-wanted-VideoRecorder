//
//  File.swift
//  VideoRecorder
//
//  Created by sokol on 2022/10/11.
//

import Foundation

//TODO: RepositoryProtocol 대신 useCase?
protocol RepositoryProtocol {
    
}

class Repository: RepositoryProtocol {
    private var httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
}
