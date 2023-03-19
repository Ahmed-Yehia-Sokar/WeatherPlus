//
//  ApiException.swift
//  WeatherPlus
//
//  Created by admin on 19/03/2023.
//

import Foundation

class ApiException: Error {
    // MARK: - properties.
    let statusCode: ApiStatusCode?
    let description: String?
    
    init(statusCode: ApiStatusCode?,
         description: String?) {
        self.statusCode = statusCode
        self.description = description
    }
}
