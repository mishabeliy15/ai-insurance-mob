//
//  MyContractsView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 14.12.2020.
//

import SwiftUI

struct MyContractsView: View {
  @ObservedObject var fetchMyContracts = FetchMyContracts()
  
  var body: some View {
    NavigationView {
      List(fetchMyContracts.contracts) { contract in
        ContractCard(contract: contract, company: fetchMyContracts.companiesID[contract.company]!)
      }
      .navigationBarTitle("Contracts")
    }
  }
}

struct MyContractsView_Previews: PreviewProvider {
  static var previews: some View {
    MyContractsView()
  }
}


