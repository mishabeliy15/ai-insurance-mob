//
//  ContentView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 08.12.2020.
//

import SwiftUI


struct ContentView: View {
  @ObservedObject var auth = IsAuthorized()
  
  var body: some View {
    if auth.isAuthorized {
      MainView()
    } else {
      LoginView(auth: auth)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(\.locale, .init(identifier: "ru"))
  }
}
