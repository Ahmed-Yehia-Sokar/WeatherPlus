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
    @Published var temperature: String = ""
    @Published var humidity: String = ""
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
                self.temperature = "\(weatherResponse.main?.temp ?? -1)"
                print("\(self.temperature)")
            }
            .store(in: &disposableBag)

    }
}
