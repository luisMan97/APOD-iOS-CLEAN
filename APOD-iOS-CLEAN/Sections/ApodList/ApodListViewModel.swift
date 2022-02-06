//
//  ApodListViewModel.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation
import Combine

class ApodListViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var apods: [ApodList.Apod.Domain] = []
    @Published var error: String?
    
    // Internal Properties
    var progressTitle = ""
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // Interactor
    private var getApodListUseCase: GetApodListUseCase
    private var getApodUseCase: GetApodUseCase
    
    // MARK: - Initializers
    
    init(getApodListUseCase: GetApodListUseCase,
         getApodUseCase: GetApodUseCase
    ) {
        self.getApodListUseCase = getApodListUseCase
        self.getApodUseCase = getApodUseCase
        getApodList()
    }
    
    // MARK: - Internal Methods
    
    func getApodList() {
        error = nil
        progressTitle = "Cargando..."
        showProgress = true
        
        let request = ApodList.Apod.Request(startDate:  DateHelper.getCurrendDateWith().toDate().dec(num: 8).toString(),
                                            endDate: DateHelper.getCurrendDateWith()
        )
        
        getApodListUseCase.invoke(request: request)
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case .failure = subscriptionCompletion {
                    self?.error = "Ha ocurrido un error, vuelve a intentar más tarde."
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: [ApodList.Apod.Domain]) in
                self?.apods = value
            })
            .store(in: &subscriptions)
    }
    
    func getApod(date: Date) {
        error = nil
        progressTitle = "Cargando..."
        showProgress = true
        
        let request = ApodList.Apod.Request(date: date.toString())
        
        getApodUseCase.invoke(request: request)
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case .failure = subscriptionCompletion {
                    self?.error = "Ha ocurrido un error, vuelve a intentar más tarde."
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: ApodList.Apod.Domain) in
                guard let self = self else {
                    return
                }
                if self.arePropertiesNull(value) {
                    self.error = "Ha ocurrido un error, vuelve a intentar más tarde."
                }
                self.apods.removeAll()
                self.apods.append(value)
            })
            .store(in: &subscriptions)
    }
    
    func arePropertiesNull(_ domain: ApodList.Apod.Domain) -> Bool {
        domain.explanation == "" && domain.date == "" && domain.title == "" && domain.imageURL == nil
    }

}
