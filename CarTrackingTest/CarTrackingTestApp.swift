//
//  CarTrackingTestApp.swift
//  CarTrackingTest
//
//  Created by Marko Paunovic on 2023-06-26.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct CarTrackingTestApp: App {
    
    init() {
        printFonts()
        FirebaseApp.configure()
    }
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        
        for familyName in fontFamilyNames {
            print("-------------")
            print("Font Family name -> [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font names  -> [\(names)]")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
