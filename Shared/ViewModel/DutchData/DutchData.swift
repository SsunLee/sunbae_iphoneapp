//
//  DutchData.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/17.
//

import Foundation
import SwiftUI

class DutchInfo: ObservableObject {
    
    @Published var dutchdatas: [DutchData] = []
    
    var id: UUID = UUID()
    var title: String = ""
    var members: [String] = []
    var price: String = ""
    var payDate: String = ""
 
    
    
    func addItem(title: String, member: [String], price: String, payDate: String = getsPayDate()){
        let newItem = DutchData(title: title, members: members, price: price, payDate: payDate)
        self.dutchdatas.append(newItem)
    }
    
    func delete(indexSet: IndexSet) {
        self.dutchdatas.remove(atOffsets: indexSet)
    }
    func addMember(indexArray: Int, member: String) {
        self.dutchdatas[indexArray].members.append(member)
    }
    func insertMember(indexArray: Int, member: String, indexAt: Int) {
        self.dutchdatas[indexArray].members.insert(member, at: indexAt)
    }
    func deleteMember(indexArray: Int, indexAt: Int) {
        self.dutchdatas[indexArray].members.remove(at: indexAt)
    }
    
    
}

func getsPayDate() -> String {
    let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
    return dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
}

struct DutchData: Identifiable {
    let id: String
    var title: String
    var members: [String]
    var price: String
    var payDate: String
    
    init(id: String = UUID().uuidString, title: String, members: [String], price: String, payDate: String = getsPayDate()){
        self.id = id
        self.title = title
        self.members = members
        self.price = price
        self.payDate = payDate
    }
}
