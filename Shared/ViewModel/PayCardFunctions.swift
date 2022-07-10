//
//  PayCardFunctions.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/10.
//

import Foundation
import SwiftUI

struct PayCardFunctions {
    
    init() {
        
    }
    

}

extension PayCardFunctions {
    func setNumberFormatter(strPrice: String) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let _price = Int(strPrice)
        let result = numberFormatter.string(for: _price)!
        
        return result
    }

    func payTypeColor(payTypeString: String) -> Color {
        if payTypeString == "수입" {
            return Color.blue
        } else {
            return Color.red
        }
    }
}
