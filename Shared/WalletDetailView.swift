//
//  WalletDetailView.swift
//  sunbae_app
//
//  Created by riiid on 2022/07/01.
//

import SwiftUI

struct WalletDetailView: View {
    
    @State var title: String = ""
    @State var member: String = ""
    @State var price: String = ""
    
    var card: CardInfo
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("지출 상세 내역")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Button(action:{
                        // action
                    }, label: {
                        Text("삭제")
                    })
                } // Hstack
                
                Spacer()
                
                Group {
                    Text("지출처")
                    TextField(card.title, text: $title)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .font(.subheadline)
                        .padding()
                    Text("사용자")
                    TextField(
                        card.member.joined(separator: ", "), text: $member)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .font(.subheadline)
                        .padding()
                    Text("금액")
                    TextField(card.price, text: $price)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .font(.subheadline)
                        .padding()
                        .keyboardType(.numberPad)
                }
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("수정하기")
                        .frame(width: geo.size.width, height: 50)
                        .background(btnColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                }).disabled(isDisable)

                
            } // Vstack
        } // Geo body
        .padding()
        .frame(maxWidth: 1500)

    } // body
    
    func StringsToString() {
        
    }
    
    var btnColor: Color  {
        return isDisable ? .gray : .blue
    }
    var isDisable: Bool {
        return title.isEmpty || member.isEmpty || price.isEmpty
    }
    
} // struct

struct WalletDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WalletDetailView(card: CardInfo)
    }
}
