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
    // TODO: associated type과 관련된 any 키워드 --> 리팩토링
    private var repository: any RepositoryProtocol
    
    private var _firstContentViewModel: FirstContentViewModel
    
    init(repository: any RepositoryProtocol) {
        self.repository = repository
        self._firstContentViewModel = FirstContentViewModel()
        
        bind()
    }
    
    func populateData() {
        // TODO: 실제 코어데이터 데이터 가져오기
        var dummys: [VideoCellContentViewModel] = []
        for _ in 0...50 {
            dummys.append(DummyMaker.getDummyVideoData())
        }
        firstContentViewModel.didReceiveData(dummys)
    }
    
    private func bind() {
        
    }
}
