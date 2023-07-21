//
//  CarDetailView.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-07-06.
//

import SwiftUI

struct CarDetailView: View {
    
    let item: String
    let id = UUID()
    
    @StateObject var randomCars = RandomOrdersModel(carImages: CarImages.init(), carContent: Car.init(carName: "", vehicleId: "", productionNumber: 0, vehicleColor: "", line: 0, carImage: ""), number: "", color: "")
    
    var body: some View {
        
        VStack {
            Text("INFO:")
                .font(Font.custom("Broadsheet Bubble", size: 30))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 150)
            
            Image(randomCars.generateRandomImage()).resizable()
                .scaledToFit()
                .frame(width: 400, height: 220)
            
            HStack {
                parameter()
                resultDetail()
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 6, x: 0, y: 3)
            .padding()
            Spacer()
        }
        .preferredColorScheme(.light)
    }
}

struct parameter: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("VIN: ")
            Text("Color: ")
            Text("Model year: ")
            Text("Mix no.: ")
            Text("Destination: ")
        }
        .padding()
        .bold()
    }
}

struct resultDetail: View {
    
    @StateObject var randomCars = RandomOrdersModel(carImages: CarImages.init(), carContent: Car.init(carName: "", vehicleId: "", productionNumber: 0, vehicleColor: "", line: 0, carImage: ""), number: "", color: "")
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(randomCars.generateRandomCarNumber(length: 15))")
            Text("\(randomCars.generateRandomCarColor())")
            Text("2023")
            Text("N/A")
            Text("N/A")
        }
        .padding()
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(item: "test")
    }
}
