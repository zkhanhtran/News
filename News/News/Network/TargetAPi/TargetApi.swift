//
//  TargetApi.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation
import Alamofire

protocol TargetApi {
    var serviceUrl: URL { get }
    var headers: HTTPHeaders? { get}
    var parameters: Parameters? { get }
    var httpMethod: HTTPMethod { get }
    var timeout: Double { get }
}
