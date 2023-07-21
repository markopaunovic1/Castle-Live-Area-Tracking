//
//  SwiftUIView.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-07-06.
//

import SwiftUI

struct CarsInLine: View {
    let car = cars
    @StateObject var randomCars = RandomOrdersModel(carImages: CarImages.init(), carContent: Car.init(carName: "", vehicleId: "", productionNumber: 0, vehicleColor: "", line: 0, carImage: ""), number: "", color: "")
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<15) { index in
                    NavigationLink(destination: CarDetailView(item: "Item \(index)")) {
                        VStack {
                            Image(randomCars.generateRandomImage())
                                .resizable()
                                .frame(width: 90, height: 35)

                            Text("\(index)")
                                .bold()
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .padding(.top, -8)
                .padding(.bottom, -8)
            }
            
            .padding()
            .border(.gray, width: 0.9)
        }
        .shadow(color: .gray, radius: 4, x: 0, y: 0)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CarsInLine()
    }
}
