//
//  newDuctModel.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/16.
//

import Foundation
import SwiftUI

class dutchModel : ObservableObject {
    @Published var prices =  [String]()
    @Published var members: [String] = [""]
    
    
//    @Binding var _prices
//
//    func bidingPrices(index: Int) -> Binding<String> {
//        _prices = prices[index]
//        return _prices
//    }
}
