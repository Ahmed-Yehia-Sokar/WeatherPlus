//
//  CurrentWeatherServicesProvider.swift
//  WeatherPlus
//
//  Created by admin on 20/03/2023.
//

import Foundation

class CurrentWeatherServicesProvider {
    static func getCurrentWeatherServices() -> CurrentWeatherServices {
        let apiClient = ApiClient()
        return CurrentWeatherServices(apiClient: apiClient)
    }
}
