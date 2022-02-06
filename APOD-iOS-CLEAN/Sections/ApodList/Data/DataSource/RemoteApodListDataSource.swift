//
//  RemoteApodListDataSource.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Combine

protocol RemoteApodListDataSource {
    func getApodList(request: ApodList.Apod.Request) -> AnyPublisher<[ApodList.Apod.Domain], Error>
    func getApod(request: ApodList.Apod.Request) -> AnyPublisher<ApodList.Apod.Domain, Error>
}
