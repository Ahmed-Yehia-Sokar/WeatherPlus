//
//  ApiConstants.swift
//  WeatherPlus
//
//  Created by admin on 19/03/2023.
//

import Foundation
import Alamofire

struct ApiConstants {
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    static let defaultParameters: Parameters = [
        "appid": "f76f8822bd3431224acc4131959c8aa2"
    ]
    static let defaultHeaders: HTTPHeaders = [
        ContentType.json.rawValue: HTTPHeaderField.acceptType.rawValue,
        ContentType.json.rawValue: HTTPHeaderField.contentType.rawValue
    ]
}
