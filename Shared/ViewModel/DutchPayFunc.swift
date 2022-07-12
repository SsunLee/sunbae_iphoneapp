//
//  DutchPayFunc.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/12.
//

import Foundation
import SwiftUI

class DutchPayFunc {
//    @State var price: Int64 = 0
//    @State var members: [String] = []
    init(memberString: String, price: String) {
        self.memberString = memberString
        self.price = price
    }
    var memberString: String
    var price: String
    var members: [String] = []

    var calData: Int64 = 0
    var returnString: String = ""
    
    func calDutchPay() -> String {
        members = memberString.split(separator: ",").map({String($0)})
        let _memberCnt = Int64(members.count)
        if let _price = Int64(price) {
            calData = _price / _memberCnt
        }
        var resultNumber: String
        resultNumber = setNumberFormatter(intPrice: calData)
        
        returnString = "정산 결과\n - 정산 대상 : \(memberString) \n - 1인당 금액 : \(resultNumber)원 씩"
        
        return returnString
        
    }
    func setNumberFormatter(intPrice: Int64) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: intPrice)!
        
        return result
    }

}

