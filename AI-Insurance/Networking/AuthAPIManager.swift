//
//  API.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 09.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthAPIManager: BaseAPIManager {
  static let LOGIN_API_URL = "\(Config.BASE_API_URL)auth/jwt/create/"
  
  func login(_ username: String,
             _ password: String,
             success successCallback: @escaping (LoginSuccesResponseData) -> Void,
             fail failCallback: @escaping (String) -> Void,
             final finalCallback: Optional<() -> Void> = nil) {
    let loginPrams = LoginRequestData(username: username, password: password)
    AF.request(AuthAPIManager.LOGIN_API_URL, method: .post, parameters: loginPrams)
      .validate()
      .responseDecodable(of: LoginSuccesResponseData.self){ response in
        switch response.result {
        case .success(let value):
          debugPrint(value)
          localStorage.set(value.access, forKey: defaultsKeys.accessToken)
          localStorage.set(value.refresh, forKey: defaultsKeys.refreshToken)
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
