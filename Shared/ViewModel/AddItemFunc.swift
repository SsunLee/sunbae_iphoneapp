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
    let selectedTypeIndex: WalletType
    
    init(card: CardData, selectedTypeIndex: WalletType) {
        self.card = card
        self.selectedTypeIndex = selectedTypeIndex
    }
}

extension AddItemFunc {
    
    enum WalletType: String, CaseIterable, Identifiable {
        case 수입
        case 지출
        
        var id: WalletType { self }
        
    }
    var isTypeColor: Color {
        return selectedTypeIndex.rawValue == "수입" ? .accentColor : .red
    }
    
    var btnColor: Color  {
        return isDisable ? .gray : .blue
    }
    var isDisable: Bool {
        return card.title.isEmpty || card.member.isEmpty || card.price.isEmpty
    }
    
    
    mutating func AddItemRow(setMember: String) {
        
        let members = setMember.split(separator: ",").map({String($0)})
        
        card.addItem(title: card.title, member: members, price: card.price, payType: selectedTypeIndex.rawValue)
        
    }
}
