//
//  CardInfoData.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI

struct CardInfo: Identifiable {
    let id = UUID()
    let title: String
    let memger: [String]
    let price: String
}

struct CardHistory {
    @State static var data = [
        CardInfo(title:"ISAKAYA",memger: ["Sunbae","Geonsuk","Hosub"],price: "132,000")
        //CardInfo(title:"Gyodae Icheungjip Sicheong",memger: ["Sunbae","Hosub"],price: "210,000"),
        //CardInfo(title:"Baekam Sundae Soup",memger: ["Sunbae","Geonsuk","Jeehoon"],price: "65,000"),
        
    ]
}


