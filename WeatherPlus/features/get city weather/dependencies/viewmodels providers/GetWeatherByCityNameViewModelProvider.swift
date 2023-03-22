//
//  GetWeatherByCityNameViewModelProvider.swift
//  WeatherPlus
//
//  Created by admin on 21/03/2023.
//

import Foundation

class GetWeatherByCityNameViewModelProvider {
    static func getWeatherByCityNameViewModel() -> GetWeatherByCityNameViewModel {
        let getCityWeatherUsecaseProvider = GetCityWeatherUsecaseProvider.getCityWeatherUsecase()
        return GetWeatherByCityNameViewModel(getCityWeatherUsecase: getCityWeatherUsecaseProvider)
    }
}
