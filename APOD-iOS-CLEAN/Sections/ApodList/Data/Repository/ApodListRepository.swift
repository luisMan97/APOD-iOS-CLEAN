//
//  ApodListRepository.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Combine

class ApodListRepository: ObservableObject {
    
    private var dataSource: RemoteApodListDataSource
    
    init(dataSource: RemoteApodListDataSource) {
        self.dataSource = dataSource
    }
    
    func getApodList(request: ApodList.Apod.Request) -> AnyPublisher<[ApodList.Apod.Domain], Error> {
        dataSource.getApodList(request: request)
            .eraseToAnyPublisher()
    }
    
    func getApod(request: ApodList.Apod.Request) -> AnyPublisher<ApodList.Apod.Domain, Error> {
        dataSource.getApod(request: request)
            .eraseToAnyPublisher()
    }
    
}
