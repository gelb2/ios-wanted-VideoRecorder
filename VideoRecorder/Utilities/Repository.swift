//
//  File.swift
//  VideoRecorder
//
//  Created by sokol on 2022/10/11.
//

import Foundation

//TODO: RepositoryProtocol 대신 useCase?
protocol RepositoryProtocol: FireBaseManagerProtocol, FileManagerProtocol {
    
}

//Firebase 데이터 관련
protocol FireBaseManagerProtocol {
    
    //var fireBaseManager: ??? { get set }
    
}

//파일저장 관련 프로토콜
protocol FileManagerProtocol {
    
    /*
     func fetchFromFileManager(fileName name: String) async throws -> MotionFile
     func saveToFileManager(file: MotionFile) async throws
     func deleteFromFileManager(fileName name: String) async throws
     */
}

class Repository: RepositoryProtocol {
    
    
    private var httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
}

extension Repository: FireBaseManagerProtocol {
    
}

extension Repository: FileManagerProtocol {
    
}
