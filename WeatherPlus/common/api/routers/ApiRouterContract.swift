//
//  ApiRouterContract.swift
//  WeatherPlus
//
//  Created by admin on 19/03/2023.
//

import Foundation
import Alamofire

protocol ApiRouterContract {
    var headers: HTTPHeaders? { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
