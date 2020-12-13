//
//  DetailPriceView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 13.12.2020.
//

import SwiftUI
import SwiftDate

struct DetailPriceView: View {
  private let greenColor = Color(red: 14 / 255.0, green: 191 / 255.0, blue: 53 / 255.0)
  
  let company: OwnPriceInCompany
  @State private var durationMonths = "3"
  @State private var valid = true
  @State private var succeded = false
  @State private var createdContract: ContractModel? = nil
  private let apiClient = CompanyAPIManager()
  
  private func isValid() -> Bool {
    let value = Int(durationMonths) ?? 0
    return (1...12).contains(value)
  }
  
  var body: some View {
    NavigationView{
      VStack() {
        DetailPriceText(title: "Personal price", value: company.ownPrice)
        DetailPriceText(title: "Speed discount", value: company.ownSpeedDiscount)
        DetailPriceText(title: "Head rotate discount", value: company.ownHeadRotateDiscount)
        DetailPriceText(title: "Base price", value: company.basePrice)
        DetailPriceText(title: "Min price", value: company.minPrice)
        DetailPriceText(title: "Max price", value: company.maxPrice)
        
        TextField("Duration (months)", text: self.$durationMonths)
          .keyboardType(.numberPad)
          .padding()
          .border(Color.blue, width: 5)
          .cornerRadius(5.0)
          .multilineTextAlignment(.center)
        
        if !valid {
          Text("Duration must be in range {3...12}").foregroundColor(.red)
        }
        if succeded {
          Text("Contract has been signed").foregroundColor(.green)
          if let date = self.createdContract?.endDate.toDate()?.toFormat("dd.MM.yyyy HH:mm:SS") {
            HStack {
              Text("Due date").foregroundColor(.red).padding(.horizontal)
              Spacer()
              Text(date).foregroundColor(.red)
            }
          }
        }
        
        Button(action: {
          if isValid() {
            let data = ContractModelRequest(company: company.id, months: Int(durationMonths)!)
            self.apiClient.signContract(data: data, success: { contract in
              self.createdContract = contract
              self.succeded = true
            }, fail: { error in
              self.valid = false
            })
          } else {
            self.valid = false;
          }
        }){
          Text("Sign a contract")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 60)
            .background(greenColor)
        }.disabled(self.succeded)

      }
      .disabled(self.succeded)
      .navigationBarTitle(self.company.name)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct DetailPriceView_Previews: PreviewProvider {
  static var previews: some View {
    DetailPriceView(company: OwnPriceInCompany(
                      id: 5,
                      created: "2020-12-13T18:49:08.134048+02:00",
                      updated: "2020-12-13T18:49:08.134075+02:00",
                      name: "Osago",
                      logo: "/media/user_6/company/6867d3c286f0481e27eb0d0e2b4b7667/maxresdefault.jpg",
                      basePrice: 1000.0,
                      minPrice: 400.0,
                      maxPrice: 3000.0,
                      percentOverSpeeding: 10.0,
                      minSpeedCommitRotateHead: 60.0,
                      minAngleCommitRotateHead: 25,
                      percentHeadRotateForHour: 5.0,
                      maxSpeedDiscount: 400.0,
                      maxSpeedPenalty: 1000.0,
                      maxRotateHeadDiscount: 100.0,
                      maxRotateHeadPenalty: 600.0,
                      owner: 6,
                      ownSpeedDiscount: 85.89,
                      ownHeadRotateDiscount: -114.16,
                      ownPrice: 1028.27)
    )
  }
}

struct DetailPriceText: View {
  var title: String
  var value: Float
  
  var body: some View {
    HStack {
      Text(
        NSLocalizedString(title, comment: "Localize detail labels")
      )
      .padding(.horizontal)
      Spacer()
      Text("\(NSString(format: "%.2f", value))")
        .padding(.horizontal)
    }
  }
}
