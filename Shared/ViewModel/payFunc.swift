//
//  AddItemFunc.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/10.
//

import Foundation
import SwiftUI


struct AddItemFunc {
    let card: CardData
    
    init(card: CardData) {
        self.card = card
    }
}

extension AddItemFunc {
    
    enum WalletType: String, CaseIterable, Identifiable {
        case 수입
        case 지출
        
        var id: WalletType { self }
        
    }
    func isTypeColor(strType: String) -> Color {
        return strType == "수입" ? .accentColor : .red
    }
    
    var btnColor: Color  {
        return isDisable ? .gray : .blue
    }
    var isDisable: Bool {
        return card.title.isEmpty || card.member.isEmpty || card.price.isEmpty
    }
    
    func setNumberFormatter(strPrice: String) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let _price = Int(strPrice)
        let result = numberFormatter.string(for: _price)!
        
        return result
    }
    
    mutating func AddItemRow(setMember: String, strType: String) {
        
        let members = setMember.split(separator: ",").map({String($0)})
        
        card.addItem(title: card.title, member: members, price: card.price, payType: strType)
        
    }
}
