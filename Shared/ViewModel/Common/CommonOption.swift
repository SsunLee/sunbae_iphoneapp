//
//  CommonOption.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/13.
//

import Foundation
import SwiftUI

struct commonOption {
    @Environment(\.colorScheme) var colorScheme

}

extension commonOption {
    
    var NaviColor: Color {
        return colorScheme == .dark ? .black : .white
    }
    
    var version: String? {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String,
              let build = dictionary["CFBundleVersion"] as? String else {return nil}
//        let versionAndBuild: String = "version: \(version), build: \(build)"
        let versionText: String = "version: \(version)"
        return versionText
    }
    
}
