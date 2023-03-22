//
//  GetCityWeatherUsecaseContract.swift
//  WeatherPlus
//
//  Created by admin on 20/03/2023.
//

import Foundation
import Combine

protocol GetCityWeatherUsecaseContract {
    func getCityWeather(byCityName cityName: String) -> Future<WeatherResponse, ApiException>
}
