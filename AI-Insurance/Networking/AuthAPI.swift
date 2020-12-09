//
//  API.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 09.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthAPI {
  static let LOGIN_API_URL = "\(Config.BASE_API_URL)auth/jwt/create/"
  
  var currentLanguage: String {
    return Locale.current.languageCode!
  }
  
  var header: HTTPHeaders {
    return [
      "Accept": "application/json",
      "Accept-Language": currentLanguage
    ]
  }
  
  func getDetailError(_ data: Data?) -> String? {
    if data != nil, let json = try? JSON(data: data!) {
      return json["detail"].string
    }
    return nil
  }
  
  func login(_ username: String,
             _ password: String,
             success successCallback: @escaping (LoginSuccesResponseData) -> Void,
             fail failCallback: @escaping (String) -> Void,
             final finalCallback: Optional<() -> Void> = nil) {
    let loginPrams = LoginRequestData(username: username, password: password)
    AF.request(AuthAPI.LOGIN_API_URL, method: .post, parameters: loginPrams)
      .validate()
      .responseDecodable(of: LoginSuccesResponseData.self){ response in
        switch response.result {
        case .success(let value):
          debugPrint(value)
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
}
