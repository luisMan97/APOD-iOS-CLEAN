//
//  ApodListFactory.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation

class ApodListFactory {
    
    class func getApodListView() -> ApodListView {
        let dataSource = ApodListURLSessionDataSource()
        
        // Repository
        let repository = ApodListRepository(dataSource: dataSource)
        
        // Interactor
        let getApodListUseCase = GetApodListUseCase(repository: repository)
        let getApodUseCase = GetApodUseCase(repository: repository)
        
        // ViewModel
        let viewModel = ApodListViewModel(getApodListUseCase: getApodListUseCase,
                                          getApodUseCase: getApodUseCase
        )
        
        return ApodListView(viewModel: viewModel)
    }
    
}
