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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    public var card: CardInfo
    
//    self.member = card.member.joined(separator: ", ")
//    self.price = card.price

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("X")
                            .padding()
                            .font(.subheadline)
                    })
                    HStack {
                        Text("지출 상세 내역")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Button(action:{
                            // action
                        }, label: {
                            Text("삭제")
                        }).padding()
                    } // Hstack
                    Spacer()
                    Group{
                        Text("지출처")
                        TextField(card.title, text: $title).onAppear() {
                            self.title = card.title
                        }
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                          .font(.subheadline)
                          .cornerRadius(7)
                        
                        Text("사용자")
                        TextField(card.member.joined(separator: ", "), text: $member).onAppear() {
                            self.member = card.member.joined(separator: ", ")
                        }
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                          .font(.subheadline)
                          .cornerRadius(7)
                        
                        Text("금액")
                        TextField(card.price, text: $price).onAppear() {
                            self.price = card.price
                        }
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                          .font(.subheadline)
                          .keyboardType(.numberPad)
                          .cornerRadius(7)
                        
                        Spacer()
                    } // group

                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("수정하기")
                            .frame(width: geo.size.width, height: 50)
                            .font(.subheadline.bold())
                            .background(btnColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                    }).disabled(isDisable)
                    
                } // Vstack
            }
        } // Geo body
        .navigationBarHidden(true)
        .padding()
        .frame(maxWidth: 1500)

    } // body
    
    var btnColor: Color  {
        return isDisable ? .gray : .blue
    }
    var isDisable: Bool {
        return title.isEmpty || member.isEmpty || price.isEmpty
    }
    
} // struct

//struct WalletDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        //WalletDetailView(CardInfo())
//    }
//}
