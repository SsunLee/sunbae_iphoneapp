//
//  CardInfoData.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI

class CardData : ObservableObject {
    @Published var cardinfos: [CardInfo] = []
    var id: UUID
    var title: String
    var member: [String]
    var price: String
     
    init(id: UUID, title: String, member:[String], price: String) {
        self.id = UUID()
        self.title = title
        self.member = member
        self.price = price
    }
    
    
}



struct CardInfo: Identifiable {
    let id = UUID()
    let title: String
    let memger: [String]
    let price: String
}

struct CardHistory {
    static var data = [
        CardInfo(title:"ISAKAYA",memger: ["Sunbae","Geonsuk","Hosub"],price: "132,000")
        
    ]
}


