//
//  CurrentWeatherApiRouter.swift
//  WeatherPlus
//
//  Created by admin on 19/03/2023.
//

import Foundation
import Alamofire

enum CurrentWeatherApiRouter: ApiRouterContract {
    case getWeatherByCityName(cityName: String,
                              temperatureUnit: String)
    
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
        case .getWeatherByCityName(let cityName,
                                   let temperatureUnit):
            return getWeatherByCityNameParameters(cityName: cityName,
                                                  temperatureUnit: temperatureUnit)
        }
    }
}

extension CurrentWeatherApiRouter {
    private func getWeatherByCityNameParameters(cityName: String,
                                                temperatureUnit: String) -> Parameters? {
        var parameters = ApiConstants.defaultParameters
        parameters["q"] = cityName
        return parameters
    }
}
