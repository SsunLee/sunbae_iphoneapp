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
    
    func isDisabled() -> Bool {
        var tempVal_one: Int = 0
        var tempVal_two: Int = 0

        for eleOne in dutchdatas {
            if (eleOne.price.isEmpty) {
                tempVal_one += 1
            }
            for eleTwo in eleOne.members {
                if (eleTwo.isEmpty) {
                    tempVal_two += 1
                }
            }
        }
        
        let isCountZero = dutchdatas.count == 0 ? true : false
        let isValueIsEmptry = (tempVal_one + tempVal_two) > 0 ? true : false
        
        return isCountZero || isValueIsEmptry
    }
    
    var btnColor: Color {
        return isDisabled() ? .gray : .accentColor
    }
    
    func getDutchInfo() -> String {
        var memString: String = ""
        var calArray: [TempArray] = []
        var tempInt: Int = 0
        var i: Int = 0
        var tempString: String = ""
        
        for eleOne in dutchdatas {
            i += 1
            for eleTwo in eleOne.members {
                if let _price = Int(eleOne.price) {
                    tempInt = _price / eleTwo.count
                    calArray.append(TempArray(price: tempInt, member: eleTwo))
                    print("인원 수 : \(eleTwo.count)")
                }
            }
            memString = eleOne.members.joined(separator: ", ")
            tempString += "\(String(i))차 정산(\(memString)) \n - 총 : \(setNumberFormatter(strPrice: String(eleOne.price))) \n "
        }
        let arrayClean = calArray.uniqueValues(value: {$0.member})
        tempString += "\n---------------\n"
        for mem in arrayClean {
            tempString += "- \(mem.member) : \(setNumberFormatter(strPrice: String(mem.price))) \n"
        }
        var totCal: Int = 0
        for tot in arrayClean {
            totCal += tot.price
        }
        tempString += "총합 : \(setNumberFormatter(strPrice: String(totCal)))"
        
        return tempString
    }
    
    func setNumberFormatter(strPrice: String) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let _price = Int(strPrice)
        let result = numberFormatter.string(for: _price)!
        
        return result
    }
    
}
extension Array
{
   func uniqueValues<V:Equatable>( value:(Element)->V) -> [Element]
   {
      var result:[Element] = []
      for element in self
      {
          if !result.contains(where: { value($0) == value(element) })
         { result.append(element) }
      }
      return result
   }
}
struct TempArray {
    var price: Int
    var member: String
    init(price: Int, member: String) {
        self.price = price
        self.member = member
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
    var title: String  // 토종맛집
    var members: [String] // (이순배, 홍길동, 홍길순)
    var price: String   // 136,000
    var payDate: String
    
    init(id: String = UUID().uuidString, title: String, members: [String], price: String, payDate: String = getsPayDate()){
        self.id = id
        self.title = title
        self.members = members
        self.price = price
        self.payDate = payDate
    }
}
