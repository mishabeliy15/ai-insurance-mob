//
//  CompanyAPIManager.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 10.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON


class CompanyAPIManager: BaseAPIManager {
  static let OWN_PRICES_API_URL = "\(Config.BASE_API_URL)companies/personal_price/"
  static let CREATE_CONTRACT_API_URL = "\(Config.BASE_API_URL)contracts/"
  
  func getOwnPriceInCompanies(
    success successCallback: @escaping (Array<OwnPriceInCompany>) -> Void,
    fail failCallback: Optional<(String) -> Void> = nil,
    final finalCallback: Optional<() -> Void> = nil) {
    AF.request(CompanyAPIManager.OWN_PRICES_API_URL, method: .get, headers: self.authHeader)
      .validate()
      .responseDecodable(of: Array<OwnPriceInCompany>.self){ response in
        switch response.result {
        case .success(let value):
          successCallback(value)
        case .failure(_):
          let errorMessage = self.getDetailError(response.data) ?? "Issue with network"
          if let fail = failCallback{
            fail(errorMessage);
          }
        }
        if let final = finalCallback {
          final()
        }
      }
  }
  
  func signContract(
    data: ContractModelRequest,
    success successCallback: @escaping (ContractModel) -> Void,
    fail failCallback: Optional<(String) -> Void> = nil,
    final finalCallback: Optional<() -> Void> = nil) {
    AF.request(CompanyAPIManager.CREATE_CONTRACT_API_URL, method: .post, parameters: data, headers: self.authHeader)
      .validate()
      .responseDecodable(of: ContractModel.self){ response in
        switch response.result {
        case .success(let contract):
          successCallback(contract)
        case .failure(_):
          let errorMessage = self.getDetailError(response.data) ?? "Issue with network"
          if let fail = failCallback{
            fail(errorMessage);
          }
        }
        if let final = finalCallback {
          final()
        }
      }
  }
}
