//
//  FetchCompanyPrices.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 13.12.2020.
//

import Foundation

class FetchCompanyPrices: ObservableObject {
  let apiClient = CompanyAPIManager()
  
  @Published var companies = [OwnPriceInCompany]()
  @Published var isLoading = true
  
  init() {
    fetchPrices()
  }

  private func fetchPrices() {
    self.apiClient.getOwnPriceInCompanies(success: { result in
      self.companies = result
      self.isLoading = false
    })
  }
}
