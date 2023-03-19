//
//  ApiClient.swift
//  WeatherPlus
//
//  Created by admin on 19/03/2023.
//

import Foundation
import Alamofire
import Combine

class ApiClient {
    // MARK: - public methods.
    func performRequest<T: Decodable, E: ApiException>(url: String,
                                                       headers: HTTPHeaders? = nil,
                                                       method: HTTPMethod,
                                                       parameters: Parameters? = nil,
                                                       decoder: JSONDecoder = JSONDecoder()) -> Future<T, E> {
        Future { promise in
            AF.request(url,
                       method: method,
                       parameters: parameters,
                       headers: headers)
                .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        let apiException = self.getApiException(error)
                        promise(.failure(apiException as! E))
                    }
                }
        }
    }
    
    // MARK: - private methods.
    private func getApiException(_ error: AFError) -> ApiException {
        let statusCode = ApiStatusCode(rawValue: error.responseCode ?? -1)
        return ApiException(statusCode: statusCode, description: statusCode?.description)
    }
}
