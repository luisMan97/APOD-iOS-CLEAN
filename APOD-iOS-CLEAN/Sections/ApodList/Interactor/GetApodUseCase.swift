//
//  GetApodUseCase.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 30/01/22.
//

import Combine

class GetApodUseCase: ObservableObject {
    
    // Repository
    private var repository: ApodListRepository
    
    // MARK: - Initializers
    
    init(repository: ApodListRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(request: ApodList.Apod.Request) -> AnyPublisher<ApodList.Apod.Domain, Error> {
        repository.getApod(request: request)
    }

}
