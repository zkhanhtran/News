//
//  NewsViewModel.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation
import RxSwift
import RxCocoa

class NewsViewModel {
    let disposeBag = DisposeBag()
    var news: BehaviorRelay = BehaviorRelay<[Article]>(value: [])
    var repository: NewsRepositoryProtocol = NewsRepository()
    
    func getNews(keyword: String = "") {
        repository.getNews(keyword: keyword)
            .subscribe(onSuccess: {[weak self] newsModels in
                self?.news.accept(newsModels.articles)
            },
                       onFailure: {error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
