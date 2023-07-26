//
//  RandomOrdersModel.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-07-08.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseFirestoreSwift

class RandomOrdersModel : ObservableObject {
    
    let timer : Timer
    @Published var carImages : CarImages
    @Published var carContent = [Car]()
    let db = Firestore.firestore()
    
    @Published var number: String
    @Published var color: String
    
    
    init(carImages: CarImages, carContent: Car, number: String, color: String, timer: Timer) {
        self.carImages = carImages
        self.number = number
        self.color = color
        self.timer = timer
    }
    
    //*MARK: Generates random Vehicle ID
    func generateRandomCarNumber(length: Int) -> String {
        let alphanumericCharecters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString = String((0..<length).map { _ in
            alphanumericCharecters.randomElement()! })
        
        return randomString
    }
    
    //*MARK: Generates random car color
    func generateRandomCarColor() -> String {
        let colors = ["Crystal White","Onyx Black","Denim Blue"," Thunder Grey","Platinum Grey"," Silver Dawn","Bright Dusk","Black Stone"]
        let randomIndex = Int.random(in: 0..<colors.count)
        
        return colors[randomIndex]
    }
    
    //*MARK: Generates random car image
    func generateRandomImage() -> String {
        
        let carImages = ["v90-crystal-white","v90-onyx-black","v60-black-stone","v60-fusion-red","v90-silver-dusk","v90-thunder-grey","xc60-crystal-white","xc60-denim-blue","xc60-fusion-red","xc60-onyx-black","xc90-bright-dusk","xc90-denim-blue","xc90-onyx-black","xc90-platinum-grey","xc90-silver-dawn","xc90-thunder-grey","xc90Crystal white"]
        let randomIndex = Int.random(in: 0..<carImages.count)
        
        return carImages[randomIndex]
    }
    
    //*MARK: Generates random region to the order destination
    func generateRandomRegion() -> String {
        
        let regions = ["North America", "South America", "Central America", "Caribbean", "Central Asia", "Northeastern Asia", "Southeastern Asia", "Australia", "Northern Europe", "Southern Europe", "Eastern Europe", "Western Europe", "Middle East", "Northern Africa", "Southern Africa"]
        let randomIndex = Int.random(in: 0..<regions.count)
        
        return regions[randomIndex]
    }
    
    //MARK: This function show when the vehicle was created
    func productionByOrderTime(date: Date) -> String {
        
        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd / HH:mm:ss"
        
        return dateformatter.string(from: date)
    }
    
    func generateNewCar() {
        
        let car = Car(carName: "XC90",
                      vehicleId: generateRandomCarNumber(length: 15),
                      productionNumber: 1,
                      vehicleColor: generateRandomCarColor(),
                      line: 1,
                      carImage: carImages.xc90CarImages(),
                      orderDate: productionByOrderTime(date: Date()),
                      destination: generateRandomRegion())
        
        do {
            try db.collection("XC90").document().setData(from: car)
        } catch let error {
            print("Error writing car to Firestore \(error)")
        }
        
    }
    
//    func generateRandomCars(count: Int) -> [RandomOrdersModel] {
//
//        var randomCar: [RandomOrdersModel] = []
//
//        for _ in 0..<count {
//            let carNumber = generateRandomCarNumber(length: 6)
//            let carColor = generateRandomCarColor()
//            _ = generateRandomImage()
//
//            let car = RandomOrdersModel(number: carNumber, color: carColor)
//            randomCar.append(car)
//        }
//        return randomCar
//    }
    
    func upploadXc90() {
        
        db.collection("XC90").document().setData([
            
            "vehicleId" : generateRandomCarNumber(length: 15),
            "carName" : "XC90",
            "Mix no. " : generateRandomCarNumber(length: 15),
            "vehicleColor" : generateRandomCarColor(),
            "vehicleImage" : carImages.xc90CarImages(),
            "destination" : generateRandomRegion()
            
        ])
        
        db.collection("XC60").document().setData([
            
            "vehicleId" : generateRandomCarNumber(length: 15),
            "carName" : "XC60",
            "vehicleColor" : generateRandomCarColor(),
            "vehicleImage" : carImages.xc60CarImages(),
            "destination" : generateRandomRegion()
            
        ]) {
            err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
//    func upploadXc60() {
//        
//        db.collection("XC60").document().setData([
//            
//            "vehicleId" : generateRandomCarNumber(length: 15),
//            "carName" : "XC60",
//            "vehicleColor" : generateRandomCarColor(),
//            "vehicleImage" : carImages.xc60CarImages(),
//            "destination" : generateRandomRegion()
//            
//        ]) {
//            err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//        
//    }
    
    func upploadV90() {
        
        db.collection("V90").document().setData([
            
            "vehicleId" : generateRandomCarNumber(length: 15),
            "carName" : "V90",
            "vehicleColor" : generateRandomCarColor(),
            "vehicleImage" : carImages.v90CarImages(),
            "destination" : generateRandomRegion()
            
        ]) {
            err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    func upploadV60() {
        
        db.collection("V60").document().setData([
            
            "vehicleId" : generateRandomCarNumber(length: 15),
            "carName" : "V60",
            "vehicleColor" : generateRandomCarColor(),
            "vehicleImage" : carImages.v60CarImages(),
            "destination" : generateRandomRegion()
            
        ]) {
            err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    func readData() {
        
        db.collection("XC60").addSnapshotListener { (querySnapShot, error) in
            guard let documents = querySnapShot?.documents else {
                print("Error reading data")
                return
            }
            
            self.carContent = documents.map { ( queryDocumentSnapshot) -> Car in
                let data = queryDocumentSnapshot.data()
                let carName = data["carName"] as? String ?? ""
                let carImage = data["carImage"] as? String ?? ""
                let destination = data["destination"] as? String ?? ""
                let line = data["line"] as? Int ?? 0
                let orderDate = data["orderDate"] as? String ?? ""
                let productionNumber = data["productionNumber"] as? Int ?? 0
                let vehicleColor = data["vehicleColor"] as? String ?? ""
                let vehicleId = data["vehicleId"] as? String ?? ""
                
                return Car(carName: carName,
                           vehicleId: vehicleId,
                           productionNumber: productionNumber,
                           vehicleColor: vehicleColor,
                           line: line,
                           carImage: carImage,
                           orderDate: orderDate,
                           destination: destination)
                
            }
        }

        
        
        
        
        
//        let docRef = db.collection("XC90").document()
//
//        docRef.getDocument() { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing: )) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
        
        
    
    }
}

