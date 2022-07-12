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
    
}
