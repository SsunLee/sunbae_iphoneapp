//
//  CardInfoData.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI

struct CardInfoData: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme){
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
    
}

extension CardInfoData {
    static var sampleData: [CardInfoData] {
        [
            CardInfoData(title: "HANZAN", attendees: ["sunbae","hosub"], lengthInMinutes: 60000, theme:.yellow),
            CardInfoData(title: "sogongdong", attendees: ["sunbae","joohyun"], lengthInMinutes: 132000, theme: .orange)
        ]
    }
}
