//
//  Constants.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 09.12.2020.
//

import Foundation


struct Config {
  static let API_SCHEMA = "http://"
  static let API_DOMAIN = "192.168.0.108"
  static let API_PORT = "80"
  static let API_PREFIX = "/api/v0/"
  static let BASE_API_URL = "\(API_SCHEMA)\(API_DOMAIN):\(API_PORT)\(API_PREFIX)"
}
