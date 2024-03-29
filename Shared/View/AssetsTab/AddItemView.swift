//
//  AddItemView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/14.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var card: CardData
    
    @State var title: String = ""
    @State var member: String = ""
    @State var price: String = ""
    @State private var selectedTypeIndex: WalletType = .수입
    @State private var TextText: String = "구분을 선택해주세요. 😀"
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            GeometryReader { geo in
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.backward")
                        })
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
                                    //
                                }, label: {
                                    Text(selectedTypeIndex.rawValue)
                                        .font(.subheadline.bold())
                                })
                                .frame(width: 60, height: 15, alignment: .center)
                                .padding(5)
                                .accentColor(.white)
                                .background(isTypeColor)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                            }
                            .padding()
                            .id(selectedTypeIndex)
                        }
                        Divider()
                        Spacer()
                        
                        Group{
                            Label("사용처",systemImage: "pencil")
                            TextField("ex) 월급 or 저녁 or 삼성역전", text: $title)
                                .padding()
                              .background(Color(uiColor: .secondarySystemBackground))
                              .font(.subheadline)
                            
                            Label("이름 : ",systemImage: "person.3.sequence")
                            TextField("ex) 이순배, 홍길동", text: $member)
                              .padding()
                              .background(Color(uiColor: .secondarySystemBackground))
                              .font(.subheadline)
                            
                            Label("금액 : ",systemImage: "wonsign.circle")
                            TextField("ex) 32000", text: $price)
                              .padding()
                              .background(Color(uiColor: .secondarySystemBackground))
                              .font(.subheadline)
                              .keyboardType(.numberPad)
                            Spacer()
                        } // group
                        
                        Button(action: {
                            AddItemRow()
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                                Text("Save")
                                    .frame(width: geo.size.width, height: 50)
                                    .background(btnColor)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                        }).disabled(isDisable)
                    }
                }
            } // geomegryReader
            .navigationBarHidden(true)
            .frame(maxWidth: 1500)
            .padding()
        
    }
    enum WalletType: String, CaseIterable, Identifiable {
        case 수입
        case 지출
        
        var id: WalletType { self }
        
    }
    var isTypeColor: Color {
        return selectedTypeIndex.rawValue == "수입" ? .accentColor : .red
    }
    
    var btnColor: Color  {
        return isDisable ? .gray : .blue
    }
    var isDisable: Bool {
        return title.isEmpty || member.isEmpty || price.isEmpty
    }
    
    
    func AddItemRow() {
        var setMember: [String]
        
        setMember = member.split(separator: ",").map({String($0)})
        
        card.addItem(title: title, member: setMember, price: price, payType: selectedTypeIndex.rawValue)
        
    }
    
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .environmentObject(CardData())
    }
}
