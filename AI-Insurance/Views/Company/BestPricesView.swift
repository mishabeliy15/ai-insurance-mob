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
    NavigationView {
      List(fetchCompanyPrices.companies) { company in
        NavigationLink(destination: DetailPriceView(company: company)) {
          CompanyPriceCard(company: company)
        }
      }
      .navigationBarTitle("Companies")
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
        Text("Personal price")
        Spacer()
        Text("\(NSString(format: "%.2f", company.ownPrice)) $")
        Image(systemName: "questionmark.circle")
          .resizable()
          .scaledToFit()
          .aspectRatio(contentMode: .fit)
          .frame(height:25)
      }
    }
  }
}
