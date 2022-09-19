//
//  NewsRepository.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation
import RxSwift

protocol NewsRepositoryProtocol {
    func getNews(keyword: String) -> Single<NewsModel>
}

struct NewsRepository: NewsRepositoryProtocol {
    let apiClient = ApiClient()
    
    func getNews(keyword: String) -> Single<NewsModel> {
        let target: NewsTargetApi = .search(keyword: keyword)
        return ApiClient.shared.requestSingle(target: target)
    }
}
