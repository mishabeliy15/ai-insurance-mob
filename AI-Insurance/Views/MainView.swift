//
//  MainView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 13.12.2020.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      BestPricesView()
      .tabItem {
        Image(systemName: "plus.square.on.square")
        Text("Companies")
      }
      AddSensorView()
        .tabItem {
          Image(systemName: "barcode.viewfinder")
          Text("Add Sensor")
        }
    }
  }
  
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
