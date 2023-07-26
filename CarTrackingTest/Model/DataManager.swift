//
//  DataManager.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-07-27.
//

import Foundation
import Firebase


class DataManager: ObservableObject {
    @Published var cars: [Car] = []
    
    init() {
        fetchCars()
    }
    
    func fetchCars() {
        cars.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("XC90")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let carName = data["carName"] as? String ?? ""
                    let carImage = data["carImage"] as? String ?? ""
                    let destination = data["destination"] as? String ?? ""
                    let line = data["line"] as? Int ?? 0
                    let orderDate = data["orderDate"] as? String ?? ""
                    let productionNumber = data["productionNumber"] as? Int ?? 0
                    let vehicleColor = data["vehicleColor"] as? String ?? ""
                    let vehicleId = data["vehicleId"] as? String ?? ""
                    
                    let carInfo = Car(carName: carName,
                                      vehicleId: vehicleId,
                                      productionNumber: productionNumber,
                                      vehicleColor: vehicleColor,
                                      line: line,
                                      carImage: carImage,
                                      orderDate: orderDate,
                                      destination: destination)
                    self.cars.append(carInfo)
                }
            }
        }
    }
}
