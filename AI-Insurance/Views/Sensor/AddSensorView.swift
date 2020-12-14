//
//  QrCodeScanner.swift
//  AI-Insurance
//
//  Created by Misha Beliy on 14.12.2020.
//

import SwiftUI
import CodeScanner

struct AddSensorView: View {
  @State var sensor: BaseSensorData?
  @State var isFailed = false
  @State var isSuccess = false
  private let apiClient = SensorAPIManager()
  
  var body: some View {
    VStack() {
      self.scanner
      Text("Scan a QR code to add sensor")
      if self.isFailed {
        Text("Invalid QR code").foregroundColor(.red)
      }
      if self.isSuccess {
        Text("Added sensor:").foregroundColor(.green)
        if let value = self.sensor {
          switch value.sensorType {
          case .movement:
            Text("Movement")
          case .camera:
            Text("Camera")
          }
          Text(value.id)
        }
      }
    }
  }
  
  var scanner : some View {
    CodeScannerView(
      codeTypes: [.qr],
      scanMode: .oncePerCode,
      completion: { result in
        if case let .success(code) = result {
          let sensorData = try! JSONDecoder().decode(BaseSensorData.self, from: code.data(using: .utf8)!)
          debugPrint(code)
          self.apiClient.addSensor(sensorData, success: { sensor in debugPrint(sensor)
            self.sensor = sensor
            self.isSuccess = true
            self.isFailed = false
          }, fail: { response in
            debugPrint(response)
            self.isSuccess = false
            self.isFailed = true
          })
        }
      }
    )
  }
}

struct AddSensorView_Previews: PreviewProvider {
  static var previews: some View {
    AddSensorView()
  }
}
