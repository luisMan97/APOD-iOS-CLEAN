//
//  ApodListURLSessionDataSource.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation
import Combine

class ApodListURLSessionDataSource: RemoteApodListDataSource {
    
    func getApodList(request: ApodList.Apod.Request) -> AnyPublisher<[ApodList.Apod.Domain], Error> {
        return getApodList(request: request)
            .map(mapResponseToDomain)
            .eraseToAnyPublisher()
    }
    
    func getApod(request: ApodList.Apod.Request) -> AnyPublisher<ApodList.Apod.Domain, Error> {
        return getApod(request: request)
            .map(mapResponseToDomain)
            .eraseToAnyPublisher()
    }
    
}

private extension ApodListURLSessionDataSource {
    
    func getApodList(request: ApodList.Apod.Request) -> AnyPublisher<[ApodList.Apod.Response], Error> {
        let parameters = [
            "start_date": request.startDate,
            "end_date": request.endDate
        ]
        
        return APIManager.request(service: .Apods(parameters))
    }
    
    private func mapResponseToDomain(_ serverResponse: [ApodList.Apod.Response]) -> [ApodList.Apod.Domain] {
        serverResponse.compactMap { $0.toDomain() }
    }
    
    func getApod(request: ApodList.Apod.Request) -> AnyPublisher<ApodList.Apod.Response, Error> {
        let parameters = [
            "date": request.date
        ]
        
        return APIManager.request(service: .Apod(parameters))
    }
    
    private func mapResponseToDomain(_ serverResponse: ApodList.Apod.Response) -> ApodList.Apod.Domain {
        serverResponse.toDomain()
    }
    
}
