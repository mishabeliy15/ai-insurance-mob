//
//  MySensorView.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 14.12.2020.
//

import SwiftUI

struct MySensorView: View {
  @ObservedObject var fetchSensors = FetchMySensors()
  
  var body: some View {
    NavigationView {
      List(fetchSensors.sensors) { sensor in
        VStack {
          switch sensor.sensorType {
          case .movement:
            Image("Movement")
              .resizable()
              .scaledToFill()
              .aspectRatio(contentMode: .fill)
              .frame(height: 150)
              .clipped()
              .cornerRadius(20.0)
          case .camera:
            Image("Camera")
              .resizable()
              .scaledToFill()
              .aspectRatio(contentMode: .fill)
              .frame(height: 150)
              .clipped()
              .cornerRadius(20.0)
          }
          Text(sensor.id)
        }
      }
      .navigationBarTitle("Sensors")
    }
  }
}

struct MySensorView_Previews: PreviewProvider {
  static var previews: some View {
    MySensorView()
  }
}


class FetchMySensors: ObservableObject {
  let apiClient = SensorAPIManager()
  
  @Published var sensors = [SensorData]()
  @Published var isLoading = true
  
  init() {
    fetchMySensors()
  }
  
  func fetchMySensors() {
    self.apiClient.getMySensor(success: { result in
      self.sensors = result
      self.isLoading = false
    })
  }
}
