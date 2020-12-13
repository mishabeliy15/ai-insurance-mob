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
        Image(systemName: "phone.fill")
        Text("First Tab")
      }
    }
  }
  
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
