//
//  CompanyModels.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 10.12.2020.
//

import Foundation


struct OwnPriceInCompany: Codable, Identifiable {
  var id: Int
  var created: String
  var updated: String
  var name: String
  var logo: String
  var basePrice: Float
  var minPrice: Float
  var maxPrice: Float
  var percentOverSpeeding: Float
  var minSpeedCommitRotateHead: Float
  var minAngleCommitRotateHead: Int
  var percentHeadRotateForHour: Float
  var maxSpeedDiscount: Float
  var maxSpeedPenalty: Float
  var maxRotateHeadDiscount: Float
  var maxRotateHeadPenalty: Float
  var owner: Int
  var ownSpeedDiscount: Float
  var ownHeadRotateDiscount: Float
  var ownPrice: Float
  
  enum CodingKeys: String, CodingKey {
    case id
    case created
    case updated
    case name
    case logo
    case basePrice = "base_price"
    case minPrice = "min_price"
    case maxPrice = "max_price"
    case percentOverSpeeding = "percent_over_speeding"
    case minSpeedCommitRotateHead = "min_speed_commit_rotate_head"
    case minAngleCommitRotateHead = "min_angle_commit_rotate_head"
    case percentHeadRotateForHour = "percent_head_rotate_for_hour"
    case maxSpeedDiscount = "max_speed_discount"
    case maxSpeedPenalty = "max_speed_penalty"
    case maxRotateHeadDiscount = "max_rotate_head_discount"
    case maxRotateHeadPenalty = "max_rotate_head_penalty"
    case owner
    case ownSpeedDiscount = "own_speed_discount"
    case ownHeadRotateDiscount = "own_head_rotate_discount"
    case ownPrice = "own_price"
  }
}
