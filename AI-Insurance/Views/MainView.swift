//
//  MainView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 13.12.2020.
//

import SwiftUI

struct MainView: View {
  @State private var selectionTab = 2
  
  var body: some View {
    TabView(selection: $selectionTab) {
      MySensorView()
        .tabItem {
          Image(systemName: "antenna.radiowaves.left.and.right")
          Text("My Sensors")
        }.tag(1)
      BestPricesView()
        .tabItem {
          Image(systemName: "plus.square.on.square")
          Text("Companies")
        }.tag(2)
      AddSensorView()
        .tabItem {
          Image(systemName: "barcode.viewfinder")
          Text("Add Sensor")
        }.tag(3)
    }
  }
  
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
