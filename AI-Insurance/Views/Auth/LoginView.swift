//
//  LoginView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 08.12.2020.
//

import SwiftUI

import Alamofire

let defaults = UserDefaults.standard;

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)


let apiClient = AuthAPI();

struct LoginView: View {
  
  @State var username: String = ""
  @State var password: String = ""
  
  @State var error: String? = nil
  @State var isLoading = false;
  @State var authenticationDidSucceed = false;
  
  var body: some View {
    
    ZStack {
      if self.isLoading {
        ProgressView()
      }
      VStack {
        SignInTextView()
        UserImage()
        UsernameTextField(username: $username)
        PasswordSecureField(password: $password)
        if let errorString = error {
          Text(errorString)
            .offset(y: -10)
            .foregroundColor(.red)
            .lineLimit(nil)
        }
        
        Button(action: {
          self.isLoading = true;
          apiClient.login(self.username, self.password, success: { respose in
            debugPrint(respose)
            self.authenticationDidSucceed = true;
            self.error = nil;
          }, fail: {error in
            debugPrint(error)
            self.error = error
          }, final: {
            sleep(2)
            self.isLoading = false;
          })
        }) {
          LoginButtonContentView()
        }.cornerRadius(3.0)
      }
      .padding()
      .disabled(self.isLoading)
      .blur(radius: self.isLoading ? 10:0)
      if authenticationDidSucceed {
        Text("Login succeeded!")
          .font(.headline)
          .frame(width: 250, height: 80)
          .background(Color.blue)
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

struct UserImage: View {
  var body: some View {
    Image("InsuranceLogo")
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: 150, height: 150)
      .clipped()
      .cornerRadius(150)
      .padding(.bottom, 75)
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
      .autocapitalization(.none)
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
      .autocapitalization(.none)
  }
}
