//
//  GetCityWeatherUsecase.swift
//  WeatherPlus
//
//  Created by admin on 20/03/2023.
//

import Foundation
import Combine

class GetCityWeatherUsecase: GetCityWeatherUsecaseContract {
    // MARK: - properties.
    private let currentWeatherServices: CurrentWeatherServicesContract
    
    // MARK: - public methods.
    init(currentWeatherServices: CurrentWeatherServicesContract) {
        self.currentWeatherServices = currentWeatherServices
    }
    
    func getCityWeather(byCityName cityName: String) -> Future<WeatherResponse, Error> {
        currentWeatherServices.getCityWeather(byCityName: cityName)
    }
}
