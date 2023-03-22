//
//  CurrentWeatherServicesContract.swift
//  WeatherPlus
//
//  Created by admin on 20/03/2023.
//

import Foundation
import Combine

protocol CurrentWeatherServicesContract {
    func getCityWeather(byCityName cityName: String,
                        temperatureUnit: String) -> Future<WeatherResponse, ApiException>
}
