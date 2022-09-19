//
//  NewsTargetApi.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation
import Alamofire

enum NewsTargetApi {
    case search(keyword: String)
}

extension NewsTargetApi: TargetApi {
    var serviceUrl: URL {
        URL(string: Constant.baseUrl)!
    }
    
    var parameters: Parameters? {
        switch self {
        case .search(let keyword):
            return ["q": keyword,
                    "sortBy": "publishedAt",
                    "apiKey": Constant.apiKey]
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var timeout: Double {
        30
    }
    
    var headers: HTTPHeaders? {
        nil
    }
}
