//
//  ContractAPIManager.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 14.12.2020.
//

import Foundation
import Alamofire


class ContractAPIManager: BaseAPIManager {
  static let CONTRACT_API_URL = "\(Config.BASE_API_URL)contracts/"
  static let MY_CONTRACT_API_URL = "\(CONTRACT_API_URL)my/"
  
  func getMyContracts(success successCallback: @escaping (Array<ContractModel>) -> Void,
                   fail failCallback: Optional<() -> Void> = nil,
                   final finalCallback: Optional<() -> Void> = nil) {
    AF.request(ContractAPIManager.MY_CONTRACT_API_URL, method: .get, headers: self.authHeader)
      .validate()
      .responseDecodable(of: MyContractReponseModel.self){ response in
        switch response.result {
        case .success(let value):
          successCallback(value.results)
        case .failure(let error):
          debugPrint(error)
          failCallback?()
        }
        if let final = finalCallback {
          final()
        }
      }
  }
}
