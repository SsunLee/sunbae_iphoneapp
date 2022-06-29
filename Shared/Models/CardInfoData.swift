//
//  CardInfoData.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI

class CardData : ObservableObject {
    
    
    @Published var cardinfos: [CardInfo] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    var id: UUID = UUID()
    var title: String = ""
    var member: [String] = []
    var price: String = ""
    var payType: String = ""
    var insertDate: String = ""

    init(){
      getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([CardInfo].self, from: data)
        else { return }
        
        self.cardinfos = saveItems
    }
    func addItem(title: String, member: [String], price: String, payType: String, insertDate: String = getPayDate()){
        let newItem = CardInfo(title: title, member: member, price: price, payType: payType, insertDate: insertDate)
        cardinfos.append(newItem)
    }
    
    func deleteItem(indexSet: IndexSet){
        cardinfos.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        cardinfos.move(fromOffsets: from, toOffset: to)
    }
    func updateItem(item: CardInfo){
        if let index = cardinfos.firstIndex(where: {$0.id == item.id }) {
            cardinfos[index] = item.updateCompletion()
        }
    }
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(cardinfos) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
    func getCurrentBalence() -> String {
        var allCardInfos:[CardInfo]?
        var plusCal: Int = 0
        var minusCal: Int = 0
        
        if let data = UserDefaults.standard.value(forKey: itemsKey) as? Data {

            allCardInfos = try? JSONDecoder().decode([CardInfo].self, from: data)
            
            if let allCardInfos = allCardInfos {
                for ca in allCardInfos {
                    let _price = Int(ca.price)!
                    if (ca.payType == "수입") {
                        plusCal += _price
                    } else {
                        minusCal += _price
                    }
                }
            }
        }
        
        var result = String(plusCal - minusCal)
        result = setNumberFormatter(strPrice: result)
        
        return result
    }


}
func setNumberFormatter(strPrice: String) -> String{
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let _price = Int(strPrice)
    let result = numberFormatter.string(for: _price)!
    
    return result
}

func getPayDate() -> String {
    let nowDate = Date() // 현재의 Date (ex: 2020-08-13 09:14:48 +0000)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
    return dateFormatter.string(from: nowDate) // 현재 시간의 Date를 format에 맞춰 string으로 반환
}

struct CardInfo: Identifiable, Codable {
    let id: String
    let title: String
    let member: [String]
    let price: String
    let payType: String
    let insertDate: String
    
    init(id: String = UUID().uuidString, title: String, member: [String], price: String, payType: String, insertDate: String = getPayDate()) {
        self.id = id
        self.title = title
        self.member = member
        self.price = price
        self.payType = payType
        self.insertDate = insertDate
    }
    
    
    func updateCompletion() -> CardInfo {
        return CardInfo(title: title, member: member, price: price, payType: payType, insertDate: insertDate)
    }
}



