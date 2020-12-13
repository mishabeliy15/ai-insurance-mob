//
//  IsAuthorized .swift
//  AI-Insurance
//
//  Created by Misha Beliy on 13.12.2020.
//

import Foundation

class IsAuthorized: ObservableObject {
  @Published var isAuthorized = localStorage.string(forKey: defaultsKeys.accessToken) != nil
  
  let apiClient = AuthAPIManager()
  
  init() {
    verifyToken()
  }

  private func verifyToken() {
    if let token = localStorage.string(forKey: defaultsKeys.accessToken) {
      self.apiClient.verifyToken(token: token, success: {
        self.isAuthorized = true;
      }, fail: {
        self.isAuthorized = false;
        localStorage.removeObject(forKey: defaultsKeys.accessToken)
        localStorage.removeObject(forKey: defaultsKeys.refreshToken)
      })
    }
  }
}
