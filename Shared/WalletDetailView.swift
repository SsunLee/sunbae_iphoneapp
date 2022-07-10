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
    
    @State private var selectedTypeIndex: WalletType = .수입
    @State private var TextText: String = "구분을 선택해주세요. 😀"
    
    @EnvironmentObject var cards: CardData
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    public var card: CardInfo

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("X")
                            .font(.subheadline)
                            .padding()
                            .font(.subheadline)
                    })
                    HStack {
                        Text("\(card.payType) 상세 내역")
                            .font(.subheadline.bold())
                            .foregroundColor(.secondary)
                        Spacer()
                        Button(action:{
                            // action
                            deleteItem()
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("삭제")
                        }).padding()
                    } // Hstack
                    Spacer()
                    HStack {
                        Text(TextText)
                            .font(.subheadline.bold())
                        Spacer()
                        Menu {
                            Picker(selection: $selectedTypeIndex, label: Text("")) {
                                ForEach(WalletType.allCases, content: { t in
                                    Text(t.rawValue.capitalized)
                                        .font(.body.bold())
                                })
                            }
                        } label: {
                            Button(action: {
                                
                            }, label: {
                                Text(selectedTypeIndex.rawValue)
                                    .font(.title3.bold())
                            })
                            .frame(width: 100, height: 7, alignment: .center)
                            .padding()
                            .accentColor(.white)
                            .background(isTypeColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        }
                        .onAppear() {
                            selectedTypeIndex = selectedValue
                        }
                        .padding()
                        .id(selectedValue)
                    }
                    Divider()
                    Group{
                        Text("\(card.payType)처")
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
                        ModifyItemRow()
                        self.presentationMode.wrappedValue.dismiss()
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
    
    var selectedValue: WalletType {
        if card.payType == "수입" {
            return .수입
        }
        else {
            return .지출
        }
    }
    
    var btnColor: Color  {
        return isDisable ? .gray : .blue
    }
    var isDisable: Bool {
        return title.isEmpty || member.isEmpty || price.isEmpty
    }
    
    enum WalletType: String, CaseIterable, Identifiable {
        case 수입
        case 지출
        
        var id: WalletType { self }
        
    }
    func deleteItem() {
        cards.deleteItem(item: card)
    }
    
    func ModifyItemRow() {
        var setMember: [String]
        
        setMember = member.split(separator: ",").map({String($0)})
        
        cards.updateItem(item: CardInfo(id: card.id, title: title, member: setMember, price: price, payType: selectedTypeIndex.rawValue))
        
    }
    var isTypeColor: Color {
        return selectedTypeIndex.rawValue == "수입" ? .accentColor : .red
    }

    
} // struct

