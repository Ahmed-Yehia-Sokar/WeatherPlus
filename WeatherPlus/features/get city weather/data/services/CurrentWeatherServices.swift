//
//  CurrentWeatherServices.swift
//  WeatherPlus
//
//  Created by admin on 20/03/2023.
//

import Foundation
import Combine

class CurrentWeatherServices: CurrentWeatherServicesContract {
    // MARK: - properties.
    private let apiClient: ApiClient
    
    // MARK: - public methods.
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getCityWeather(byCityName cityName: String) -> Future<WeatherResponse, ApiException> {
        let getCityWeatherApi = CurrentWeatherApiRouter.getWeatherByCityName(cityName: cityName)
        return apiClient.performRequest(url: getCityWeatherApi.path,
                                        headers: getCityWeatherApi.headers,
                                        method: getCityWeatherApi.method,
                                        parameters: getCityWeatherApi.parameters)
    }
}
