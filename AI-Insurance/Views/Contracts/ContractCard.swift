//
//  ContractCard.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 15.12.2020.
//

import SwiftUI

struct ContractCard: View {
  let contract: ContractModel
  let company: OwnPriceInCompany
  
  @State var detail: Bool = false
  
  var body: some View {
    VStack(alignment: .leading){
      VStack(alignment: .center) {
        RemoteImage(url: "\(Config.BASE_SERVER_URL)\(company.logo)")
          .scaledToFill()
          .aspectRatio(contentMode: .fill)
          .frame(height: 150)
          .clipped()
          .cornerRadius(20.0)
        Text(company.name).bold().font(.title)
      }
      HStack {
        Text("Personal price")
        Spacer()
        Text("\(NSString(format: "%.2f", company.ownPrice)) $")
      }
      HStack {
        Text("End date")
        Spacer()
        let date = self.contract.endDate.toDate()!.toFormat("dd.MM.yyyy HH:mm:SS")
        Text(date).foregroundColor(self.contract.isEnd ? .red : .green)
      }
      HStack {
        Text("Start date")
        Spacer()
        let date = self.contract.created.toDate()!.toFormat("dd.MM.yyyy HH:mm:SS")
        Text(date)
      }
    }
  }
}
