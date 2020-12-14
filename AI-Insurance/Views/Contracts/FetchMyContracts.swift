//
//  FetchMyContracts.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 15.12.2020.
//

import Foundation


class FetchMyContracts: ObservableObject {
  let companyAPIClient = CompanyAPIManager()
  let contractAPIClient = ContractAPIManager()
  
  @Published var contracts = [ContractModel]()
  var companiesID = [Int:OwnPriceInCompany]()
  
  @Published var isLoading = true
  
  init() {
    self.fetchContractsWithCompanies()
  }
  
  func fetchContractsWithCompanies() {
    self.isLoading = true
    self.companyAPIClient.getOwnPriceInCompanies(success: {
      response in
      for company in response {
        self.companiesID[company.id] = company
      }
      self.fetchMyContracts()
    })
  }
  
  func fetchMyContracts() {
    self.isLoading = true
    self.contractAPIClient.getMyContracts(success: { result in
      self.contracts = result
      self.isLoading = false
    })
  }
}
