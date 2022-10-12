//
//  File.swift
//  VideoRecorder
//
//  Created by sokol on 2022/10/11.
//

import Foundation

//TODO: RepositoryProtocol 대신 useCase?
protocol RepositoryProtocol: FireBaseManagerProtocol, CoreDataManagerProtocol {
    
}

//Firebase 데이터 관련
protocol FireBaseManagerProtocol {
    
    //var fireBaseManager: ??? { get set }
    
}

//파일저장 관련 프로토콜
protocol CoreDataManagerProtocol {
    
    /*
     func fetchFromFileManager(fileName name: String) async throws -> MotionFile
     func saveToFileManager(file: MotionFile) async throws
     func deleteFromFileManager(fileName name: String) async throws
     */
    
    associatedtype dataType
    
    var coreDataManager: CoreDataManager { get set }
    
    // TODO: async await 처리
    func fetchFromCoreData() -> [dataType]
    func insertToCoreData(_ model: dataType)
    func deleteFromCoreData(_ model: dataType)
    
}

class Repository: RepositoryProtocol {
    
    var coreDataManager: CoreDataManager = CoreDataManager.shared
    
    private var httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
}

extension Repository: FireBaseManagerProtocol {
    
}

extension Repository: CoreDataManagerProtocol {

    func fetchFromCoreData() -> [VideoModel] {
        let data = coreDataManager.fetchData()
        return data
    }
    
    func insertToCoreData(_ model: VideoModel) {
        coreDataManager.saveData(model)
    }
    
    func deleteFromCoreData(_ model: VideoModel) {
        coreDataManager.removeData(model)
    }
}
