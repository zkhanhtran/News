//
//  ApiClient.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation
import RxSwift
import Alamofire

class ApiClient {
    let queue = DispatchQueue.global(qos: .default)
    static let shared = ApiClient()
    
    func requestSingle<T: Decodable>(target: TargetApi) -> Single<T> {
            let single = Single.create(subscribe: { (observer: @escaping (SingleEvent<T>) -> Void) -> Disposable in
                let req = AF.request(
                    target.serviceUrl,
                    method: target.httpMethod,
                    parameters: target.parameters,
                    encoding: target.httpMethod == .get ? URLEncoding.default : JSONEncoding.default, headers: nil
                )

                req.responseDecodable(queue: self.queue, decoder: JSONDecoder(), completionHandler: { (response: AFDataResponse<T>) in
                    switch response.result {
                    case let .success(apiResponse):
                        observer(.success(apiResponse))
                    case .failure:
                        let status = response.response?.statusCode ?? 0
                        observer(.failure(CustomError(code: status, message: "Some thing went wrong")))
                    }
                })
                
                #if DEBUG
                req.responseJSON(completionHandler: {response in
                    print(response)
                })
                #endif
                
                return Disposables.create()
            })
        return single
    }
}

class CustomError: Error {
    open var code: Int!
    open var message: String?

    public init(code: NSInteger, detailCode: Int = 0, message: String!) {
        self.code = code
        self.message = message
    }
}
