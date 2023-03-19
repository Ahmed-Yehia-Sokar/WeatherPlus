//
//  CityWeatherApiRouter.swift
//  WeatherPlus
//
//  Created by admin on 19/03/2023.
//

import Foundation
import Alamofire

enum CityWeatherApiRouter: ApiRouterContract {
    case getWeatherByCityName(cityName: String)
    
    var headers: HTTPHeaders? {
        return ApiConstants.defaultHeaders
    }
    
    var method: HTTPMethod {
        switch self {
        case .getWeatherByCityName:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getWeatherByCityName:
            return ApiConstants.baseURL + "/weather"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getWeatherByCityName(let cityName):
            return getWeatherByCityNameParameters(cityName: cityName)
        }
    }
}

extension CityWeatherApiRouter {
    private func getWeatherByCityNameParameters(cityName: String) -> Parameters? {
        var parameters = ApiConstants.defaultParameters
        parameters["q"] = cityName
        return parameters
    }
}
