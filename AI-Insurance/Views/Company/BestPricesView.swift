//
//  BestPricesView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 10.12.2020.
//

import SwiftUI

struct BestPricesView: View {
  @ObservedObject var fetchCompanyPrices = FetchCompanyPrices()
  
  var body: some View {
    VStack {
      List(fetchCompanyPrices.companies) { company in
        CompanyPriceCard(company: company)
      }
    }
  }
}

struct BestPricesView_Previews: PreviewProvider {
  static var previews: some View {
    BestPricesView()
  }
}

struct CompanyPriceCard: View {
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
        Text("Personal price:")
        Spacer()
        Text("\(NSString(format: "%.2f", company.ownPrice))")
        Button(action: {
          detail = !detail
        }) {
          Image(systemName: "questionmark.circle")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(height:25)
        }
      }
    }
  }
}

//struct DetailPriceText: View {
//  var title: String
//  var value: Float
//
//  var body: some View {
//    HStack {
//      Text(title)
//      Spacer()
//      Text("\(NSString(format: "%.2f", value))")
//    }
//  }
//}
