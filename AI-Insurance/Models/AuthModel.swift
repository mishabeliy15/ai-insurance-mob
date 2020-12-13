//
//  AuthModel.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 09.12.2020.
//

import Foundation


struct LoginRequestData: Codable {
  var username: String
  var password: String
}

struct LoginSuccesResponseData: Codable {
  var access: String
  var refresh: String
}

struct VerifyTokenRequestData: Codable {
  var token: String
}
