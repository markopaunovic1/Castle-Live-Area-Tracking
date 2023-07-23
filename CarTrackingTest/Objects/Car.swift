//
//  Object.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-06-26.
//

import Foundation
import SwiftUI
import FirebaseFirestore

    let cars = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15",
    ]

let random = Int.random(in: 0...15)


class Car : Codable, Identifiable {

    let carName : String?
    let vehicleId : String?
    let productionNumber : Int?
    let vehicleColor : String?
    let line : Int?
    let carImage : String?
    let orderDate : Date
    let destination : String?
    
    enum CodingKeys: String, CodingKey {
        case carName
        case vehicleId
        case productionNumber
        case vehicleColor
        case line
        case carImage
        case orderDate
        case destination
    }
    
    init(carName: String?, vehicleId: String?, productionNumber: Int?, vehicleColor: String?, line: Int?, carImage: String?, orderDate: String?, destination: String?) {
        self.carName = carName
        self.vehicleId = vehicleId
        self.productionNumber = productionNumber
        self.vehicleColor = vehicleColor
        self.line = line
        self.carImage = carImage
        self.orderDate = Date()
        self.destination = destination
    }
    
    class XC90 : Car {
        
        func addVehicle() {
//            let carImages = ["asd"]
        }
        
//        let engineType = ["D4","D5","B5","T5","T6","B6","T8"]
//
//        var xc90 = Car(carName: "XC90", vehicleId: "123", productionNumber: 0, vehicleColor: "blue", line: 2, carImage: "asd", orderDate: "yyyy-MM-dd")
    }
}
