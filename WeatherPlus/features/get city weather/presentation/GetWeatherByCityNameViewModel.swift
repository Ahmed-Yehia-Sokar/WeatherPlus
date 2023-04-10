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
    let error = CurrentValueSubject<Error?, Never>(nil)
    @Published var cityNameSearchQuery: String?
    private var disposableBag = Set<AnyCancellable>()
    private let getCityWeatherUsecase: GetCityWeatherUsecaseContract
    
    // MARK: - methods.
    init(getCityWeatherUsecase: GetCityWeatherUsecaseContract) {
        self.getCityWeatherUsecase = getCityWeatherUsecase
    }
    
    func getCityWeather(byCityName cityName: String?) {
        guard let cityName = cityName, !cityName.isEmpty else {
            temperature.send("Please enter a city name")
            return
        }
        guard let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            temperature.send("Invalid city name")
            return
        }
        getCityWeatherUsecase
            .getCityWeather(byCityName: encodedCityName)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    self?.error.send(error)
                }
            } receiveValue: { [weak self] weatherResponse in
                self?.temperature.send("\(weatherResponse.main?.temp ?? 0.0) ℉")
            }
            .store(in: &disposableBag)

    }
}
