//
//  ContentView.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-06-26.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    let car = cars
    @State var carsInLine = CarsInLine()
    @State private var showingPopover = false
    @StateObject var randomCars = RandomOrdersModel(carImages: CarImages.init(), carContent: Car.init(carName: "", vehicleId: "", productionNumber: 0, vehicleColor: "", line: 0, carImage: "", orderDate: "", destination: ""), number: "", color: "", timer: Timer())
    
    
    var body: some View {
        
        VStack {
            Text("CASTLE LIVE AREA TRACKING")
                .font(Font.custom("Broadsheet Bubble", size: 20))
                .padding(.trailing)
                .frame(maxWidth: .infinity, maxHeight: 10, alignment: .leading)
                .padding(.top, 20)
                .padding(.leading)
            NavigationView {
                
                VStack {
                    Text("TRIM 1")
                        .font(Font.custom("Broadsheet Bubble", size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .background(Color.init(red: 32/255, green: 42/255, blue: 68/255))
                        .foregroundColor(.white)
                        .padding(-9)
                        .padding(.top, 30)
                    
                    
                    CarsInLine()
                    
                    Text("TRIM 2")
                        .font(Font.custom("Broadsheet Bubble", size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .background(Color.init(red: 32/255, green: 42/255, blue: 68/255))
                        .foregroundColor(.white)
                        .padding(-9)
                        .padding(.top, 30)
                    
                    CarsInLine()
                    
                    Text("TRIM 3")
                        .font(Font.custom("Broadsheet Bubble", size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .background(Color.init(red: 32/255, green: 42/255, blue: 68/255))
                        .foregroundColor(.white)
                        .padding(-9)
                        .padding(.top, 30)
                    
                    CarsInLine()
                    
                    Text("TRIM 4")
                        .font(Font.custom("Broadsheet Bubble", size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .background(Color.init(red: 32/255, green: 42/255, blue: 68/255))
                        .foregroundColor(.white)
                        .padding(-9)
                        .padding(.top, 30)
                    
                    CarsInLine()
                    
                    Text("TRIM 5")
                        .font(Font.custom("Broadsheet Bubble", size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .background(Color.init(red: 32/255, green: 42/255, blue: 68/255))
                        .foregroundColor(.white)
                        .padding(-9)
                        .padding(.top, 30)
                    
                    CarsInLine()
                }
                .onAppear() {
                    self.randomCars.readData()
                }
            }
        }
        .preferredColorScheme(.light)
        
        Button("Simulate") {
//            randomCars.upploadXc90()
//            randomCars.upploadXc60()
//            randomCars.upploadV90()
//            randomCars.upploadV60()
            randomCars.generateNewCar()
        }
        .padding(.top, -10)
        .padding(.bottom, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
