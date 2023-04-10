//
//  ViewController.swift
//  WeatherPlus
//
//  Created by admin on 19/03/2023.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    private var viewModel = GetWeatherByCityNameViewModelProvider.getWeatherByCityNameViewModel()
    private var disposableBag = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubscriptions()

        cityNameTextField.addTarget(self,
                                    action: #selector(cityNameTextFieldValueChanged),
                                    for: .editingChanged)
        
    }
    
    // MARK: - private methods.
    private func setupSubscriptions() {
        viewModel.$cityNameSearchQuery
            .debounce(for: 1.0, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] cityNameSearchQuery in
                self?.viewModel.getCityWeather(byCityName: cityNameSearchQuery)
            }
            .store(in: &disposableBag)
        
        viewModel.temperature
            .sink { [weak self] (returnedValue: String?) in
                self?.temperatureLabel.text = returnedValue
            }
            .store(in: &disposableBag)
        
        viewModel.error
            .sink { [weak self] error in
                if let error = error {
                    self?.presentAlertView(withMessage: error.localizedDescription)
                }
            }
            .store(in: &disposableBag)
    }
    
    private func presentAlertView(withMessage message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc
    private func cityNameTextFieldValueChanged() {
        viewModel.cityNameSearchQuery = cityNameTextField.text
    }
}

