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
    func addItem(title: String, member: [String], price: String ){
        let newItem = CardInfo(title: title, member: member, price: price)
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
    
}



struct CardInfo: Identifiable, Codable {
    let id: String
    let title: String
    let member: [String]
    let price: String
    
    init(id: String = UUID().uuidString, title: String, member: [String], price: String) {
        self.id = id
        self.title = title
        self.member = member
        self.price = price
    }
    
    
    func updateCompletion() -> CardInfo {
        return CardInfo(title: title, member: member, price: price)
    }
}



