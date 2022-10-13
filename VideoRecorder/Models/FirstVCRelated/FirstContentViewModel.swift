//
//  ContentViewModel.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/11.
//

import Foundation

class FirstContentViewModel {
    
    //input
    var didReceiveData: ([VideoCellContentViewModel]) -> () = { cellViewModel in  }
    
    var didReceiveViewMoreEvent: () -> () = { }
    
    //output
    
    var propergateViewMoreEvent: () -> () = { }
    
    var dataSource: [VideoCellContentViewModel] {
        return _dataSource
    }
    
    //properties
    @MainThreadActor var propergateData: ( (()) -> () )?
    
    private var _dataSource: [VideoCellContentViewModel]
    
    
    
    init() {
        self._dataSource = []
        bind()
    }
    
    private func bind() {
        didReceiveData = { [weak self] cellViewModel in
            guard let self = self else { return }
            self._dataSource = self._dataSource + cellViewModel
            self.propergateData?(())
        }
        
        didReceiveViewMoreEvent = { [weak self] in
            guard let self = self else { return }
            print("didReceiveViewMoreEvent")
            self.propergateViewMoreEvent()
        }
    }
}
