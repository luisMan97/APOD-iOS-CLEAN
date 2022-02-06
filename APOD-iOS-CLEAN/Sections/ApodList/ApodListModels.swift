//
//  ApodListModels.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation

enum ApodList {
    
    enum Apod {
        struct Request {
            let date: String
            let startDate: String
            let endDate: String
            
            init(date: String) {
                self.date = date
                startDate = String()
                endDate = String()
            }
            
            init(startDate: String, endDate: String) {
                date = String()
                self.startDate = startDate
                self.endDate = endDate
            }
        }
        struct Response: Decodable {
            let copyright: String?
            let date: String?
            let explanation: String?
            let hdurl: String?
            let media_type: String?
            let service_version: String?
            let title: String?
            let url: String?
        }
        struct Domain: Identifiable {
            let id = UUID()
            let explanation: String
            let title: String
            let date: String
            let imageURL: URL?
        }
  }
    
}

extension ApodList.Apod.Response {
    
    func toDomain() -> ApodList.Apod.Domain {
        .init(explanation: explanation ?? "",
              title: title ?? "",
              date: date ?? "",
              imageURL: URL(string: url ?? "")
        )
    }
    
}
