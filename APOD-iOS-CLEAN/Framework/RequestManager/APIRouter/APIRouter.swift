//
//  APIRouter.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 25/01/22.
//

import Foundation

enum APIRouter {
    
    case Apods([String: Any])
    case Apod([String: Any])
    
    private var method: HTTPMethod {
        switch self {
        case .Apods,
             .Apod:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Apods(let params):
            let startDate = params["start_date"] ?? ""
            let endDate = params["end_date"] ?? ""
            return "planetary/apod?api_key=\(APIManagerConstants.apiKey)&start_date=\(startDate)&end_date=\(endDate)"
        case .Apod(let params):
            let date = params["date"] ?? ""
            return "planetary/apod?api_key=\(APIManagerConstants.apiKey)&date=\(date)"
        }
    }
    
    private var url: String {
        APIManagerConstants.endpoint
    }
    
    var request: URLRequest? {
        guard let url = NSURL(string: url + path) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url as URL)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
            case .Apods,
                 .Apod:
            return urlRequest
        }
    }
    
}
