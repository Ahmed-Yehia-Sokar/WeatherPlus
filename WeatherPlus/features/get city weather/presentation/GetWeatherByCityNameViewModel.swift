//
//  GetWeatherByCityNameViewModel.swift
//  WeatherPlus
//
//  Created by admin on 21/03/2023.
//

import Foundation
import Combine

class GetWeatherByCityNameViewModel {
    // MARK: - properties.
    let temperature = CurrentValueSubject<String, Never>("")
    let humidity = CurrentValueSubject<String, Never>("")
    private var disposableBag = Set<AnyCancellable>()
    private let getCityWeatherUsecase: GetCityWeatherUsecaseContract
    
    // MARK: - methods.
    init(getCityWeatherUsecase: GetCityWeatherUsecaseContract) {
        self.getCityWeatherUsecase = getCityWeatherUsecase
    }
    
    func getCityWeather(byCityName cityName: String) {
        getCityWeatherUsecase
            .getCityWeather(byCityName: cityName)
            .sink { completion in
                print(completion)
            } receiveValue: { weatherResponse in
                self.temperature.value = "\(weatherResponse.main?.temp ?? 0.0)"
            }
            .store(in: &disposableBag)

    }
}
