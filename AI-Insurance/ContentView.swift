//
//  ContentView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 08.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      LoginView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .environment(\.locale, .init(identifier: "ru"))
    }
}
