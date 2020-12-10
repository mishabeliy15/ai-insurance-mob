//
//  BaseAPIManager.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 09.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseAPIManager {
  var currentLanguage: String {
    return Locale.current.languageCode!
  }
  
  var header: HTTPHeaders {
    return [
      "Accept": "application/json",
      "Accept-Language": currentLanguage
    ]
  }
  
  var authHeader: HTTPHeaders {
    var baseHeader = self.header
    if let token = localStorage.string(forKey: defaultsKeys.accessToken) {
      baseHeader["Authorization"] = "Bearer \(token)"
    }
    return baseHeader
  }
  
  func getDetailError(_ data: Data?) -> String? {
    if data != nil, let json = try? JSON(data: data!) {
      return json["detail"].string
    }
    return nil
  }
}
