//
//  LoginView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 08.12.2020.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let storedUsername = "test"
let storedpassword = "test"

struct LoginView: View {
  
  @State var username: String = ""
  @State var password: String = ""
  
  @State var authenticationDidFail: Bool = false
  @State var authenticationDidSucceed: Bool = false
  
  var body: some View {
    
    ZStack {
      //      Color.white.ignoresSafeArea(.all)
      VStack {
        HelloText()
        UserImage()
        UsernameTextField(username: $username)
        PasswordSecureField(password: $password)
        if authenticationDidFail {
          Text("Information not correct. Try again.")
            .offset(y: -10)
            .foregroundColor(.red)
        }
        
        
        
        Button(action: {
          if self.username == storedUsername && self.password == storedpassword {
            self.authenticationDidSucceed = true
            self.authenticationDidFail = false
          } else {
            self.authenticationDidFail = true
            self.authenticationDidSucceed = false
          }
          debugPrint(self.username)
        }) {
          LoginButtonContent()
        }.cornerRadius(10.0)
      }
      
      .padding()
      if authenticationDidSucceed {
        Text("Login succeeded!")
          .font(.headline)
          .frame(width: 250, height: 80)
          .background(Color.yellow)
          .cornerRadius(20.0)
          .animation(Animation.default)
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}



struct HelloText: View {
  var body: some View {
    Text("loginTitle")
      .font(.largeTitle)
      .fontWeight(.semibold)
      .padding(.bottom, 20)
  }
}

struct UserImage: View {
  var body: some View {
    Image("InsuranceLogo")
      .resizable()
      .aspectRatio(contentMode: .fill)
      //      .background(Color.white)
      .frame(width: 150, height: 150)
      .clipped()
      .cornerRadius(150)
      .padding(.bottom, 75)
  }
}

struct LoginButtonContent: View {
  var body: some View {
    Text("loginTitle")
      .font(.headline)
      .foregroundColor(lightGreyColor)
      .padding()
      .frame(width: 300, height: 60)
      .background(Color(red: 23 / 255.0, green: 36 / 255.0, blue: 157 / 255.0))
  }
}

struct UsernameTextField: View {
  
  @Binding var username: String
  
  var body: some View {
    TextField("usernameString", text: $username)
      .padding()
      .border(Color.blue, width: 3)
      .cornerRadius(5.0)
      .padding(.bottom, 20)
  }
}

struct PasswordSecureField: View {
  
  @Binding var password: String
  
  var body: some View {
    SecureField("passwordString", text: $password)
      .padding()
      .border(Color.blue, width: 3)
      .cornerRadius(5.0)
      .padding(.bottom, 20)
  }
}
