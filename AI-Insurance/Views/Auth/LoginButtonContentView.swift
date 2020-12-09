//
//  LoginButtonView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 09.12.2020.
//

import SwiftUI

struct LoginButtonContentView: View {
  var body: some View {
    Text("loginTitle")
      .font(.headline)
      .foregroundColor(lightGreyColor)
      .padding()
      .frame(width: 300, height: 60)
      .background(Color(red: 23 / 255.0, green: 36 / 255.0, blue: 157 / 255.0))
  }
}

struct LoginButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
      LoginButtonContentView()
    }
}
