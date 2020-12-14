//
//  SensorModel.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 14.12.2020.
//

import Foundation

struct BaseSensorData: Codable, Identifiable, Hashable {
  var id: String
  var sensorType: SensorType
  
  enum CodingKeys: String, CodingKey {
    case id = "uuid"
    case sensorType = "sensor_type"
  }
}

enum SensorType: Int, Codable {
  case movement = 1
  case camera = 2
}

struct SensorData: Codable, Identifiable, Hashable {
  var id: String
  var sensorType: SensorType
  var created: String
  var updated: String
  var owner: Int
  
  enum CodingKeys: String, CodingKey {
    case id = "uuid"
    case sensorType = "sensor_type"
    case created
    case updated
    case owner
  }
}

struct MySensorsResponse: Codable {
  var count: Int
  var next: String?
  var previous: String?
  var results: Array<SensorData>
}
