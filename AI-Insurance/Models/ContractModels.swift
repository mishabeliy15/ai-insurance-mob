//
//  ContractModels.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 13.12.2020.
//

import Foundation


struct ContractModelRequest: Codable {
  var company: Int
  var months: Int
}

struct ContractModel: Codable, Identifiable, Hashable {
  var id: Int
  var company: Int
  var isEnd: Bool
  var created: String
  var updated: String
  var endDate: String
  var personalCoefficient: Float
  var customer: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case company
    case isEnd = "is_end"
    case created
    case updated
    case endDate = "end_date"
    case personalCoefficient = "personal_coefficient"
    case customer
  }
}
