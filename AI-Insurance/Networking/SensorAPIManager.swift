//
//  SensorAPIManager.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 14.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON


class SensorAPIManager: BaseAPIManager {
  static let SENSOR_API_URL = "\(Config.BASE_API_URL)sensors/"
  static let MY_SENSOR_API_URL = "\(SENSOR_API_URL)my/"
  
  func addSensor(_ data: BaseSensorData,
                 success successCallback: @escaping (BaseSensorData) -> Void,
                 fail failCallback: @escaping (String) -> Void,
                 final finalCallback: Optional<() -> Void> = nil) {
    AF.request(SensorAPIManager.SENSOR_API_URL, method: .post, parameters: data, headers: self.authHeader)
      .validate()
      .responseDecodable(of: BaseSensorData.self){ response in
        switch response.result {
        case .success(let value):
          successCallback(value)
        case .failure(let error):
          debugPrint(error)
          let errorMessage = self.getDetailError(response.data) ?? "Issue with network"
          failCallback(errorMessage);
        }
        if let final = finalCallback {
          final()
        }
      }
  }
  
  func getMySensor(success successCallback: @escaping (Array<SensorData>) -> Void,
                   fail failCallback: @escaping (String) -> Void,
                   final finalCallback: Optional<() -> Void> = nil) {
    AF.request(SensorAPIManager.MY_SENSOR_API_URL, method: .get, headers: self.authHeader)
      .validate()
      .responseDecodable(of: MySensorsResponse.self){ response in
        switch response.result {
        case .success(let value):
          successCallback(value.results)
        case .failure(let error):
          debugPrint(error)
          let errorMessage = self.getDetailError(response.data) ?? "Issue with network"
          failCallback(errorMessage);
        }
        if let final = finalCallback {
          final()
        }
      }
  }
}
