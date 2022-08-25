//
//  sunbae_appApp.swift
//  Shared
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI
import GoogleMobileAds

@main
struct sunbae_appApp: App {
    
    @StateObject var csManager = ColorSchemeManager()
    
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    
    var body: some Scene {
        
        WindowGroup {
            SplashView()
                .environmentObject(csManager)
                .environmentObject(CardData())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    csManager.applyColorScheme()
                    
            }
        }
    }
}
