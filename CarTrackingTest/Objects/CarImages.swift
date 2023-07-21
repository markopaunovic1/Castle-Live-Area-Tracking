//
//  CarImages.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-07-18.
//

import Foundation

class CarImages : ObservableObject {
    
    func xc90CarImages() -> String {
        
        let xc90Images = ["xc90Crystal white",
                          "xc90-thunder-grey",
                          "xc90-silver-dawn",
                          "xc90-platinum-grey",
                          "xc90-onyx-black",
                          "xc90-denim-blue",
                          "xc90-bright-dusk"]
        
        let randomIndex = Int.random(in: 0..<xc90Images.count)
        return xc90Images[randomIndex]
    }
    
    
    func xc60CarImages() -> String {
        
        let xc60Images = ["xc60-crystal-white",
                          "xc60-denim-blue",
                          "xc60-fusion-red",
                          "xc60-onyx-black"]
        
        let randomIndex = Int.random(in: 0..<xc60Images.count)
        return xc60Images[randomIndex]
    }
    
    
    func v90CarImages() -> String {
        
        let v90Images = ["v90-silver-dusk",
                         "v90-thunder-grey",
                         "v90-crystal-white",
                         "v90-onyx-black"]
        
        let randomIndex = Int.random(in: 0..<v90Images.count)
        return v90Images[randomIndex]
    }
    
    
    func v60CarImages() -> String {
        
        let v60Images = ["v60-black-stone",
                         "v60-fusion-red"]
        
        let randomIndex = Int.random(in: 0..<v60Images.count)
        return v60Images[randomIndex]
    }
}
