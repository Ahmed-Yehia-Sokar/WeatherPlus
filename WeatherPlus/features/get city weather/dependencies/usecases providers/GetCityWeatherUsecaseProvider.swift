//
//  GetCityWeatherUsecaseProvider.swift
//  WeatherPlus
//
//  Created by admin on 20/03/2023.
//

import Foundation

class GetCityWeatherUsecaseProvider {
    static func getCityWeatherUsecase() -> GetCityWeatherUsecase {
        let currentWeatherServices = CurrentWeatherServicesProvider.getCurrentWeatherServices()
        return GetCityWeatherUsecase(currentWeatherServices: currentWeatherServices)
    }
}
