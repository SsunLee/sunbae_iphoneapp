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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Group() {
                        Label("상호명",systemImage: "pencil")
                        TextField("Enter your history", text: $title)
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                          .font(.subheadline)
                        Label("Member : ",systemImage: "person.3.sequence")
                        TextField("Enter a members", text: $member)
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                          .font(.subheadline)
                        Label("Price : ",systemImage: "wonsign.circle")

                        TextField("Enter a price", text: $price)
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                          .font(.subheadline)
                        Spacer()
                        
                        Button(action: {
                            AddItemRow()
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Save")
                                .foregroundColor(.white)
                                .frame(width: 320, height: 40)
                                .background(btnColor)
                                .cornerRadius(15)
                                .padding()
                        }).disabled(isDisable())
                    }
                }
                .navigationBarTitle(Text("자산 추가"), displayMode: .inline)
            }

//                .toolbar {
//                    Button(action: {
//                        // if you button click
//                        AddItemRow()
//                        self.presentationMode.wrappedValue.dismiss()
//                    }) { // plus button
//                        Text("Save")
//                    }
//                    .disabled(isDisable())
//                    .accessibilityLabel("save")
//                }

        }.padding()
    }
    var btnColor: Color  {
        return isDisable() ? .gray : .green
    }
    func isDisable() -> Bool {
        var cnt: Int = 0
        let lst = [title, member, price]
        
        for c in lst {
            if (c.isEmpty){
                cnt += 1
            }
        }
        return cnt > 0 ? true : false
    }
    
    
    func AddItemRow() {
        var setMember: [String]
        
        setMember = member.split(separator: ",").map({String($0)})
        
        card.cardinfos.append(
            CardInfo(
                title:title,
                memger: setMember,
                price: price)
        )

    }
    
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
