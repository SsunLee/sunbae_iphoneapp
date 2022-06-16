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
            ScrollView() {
                VStack(alignment: .leading, spacing: 15) {
                    Spacer()
                    Label("title",systemImage: "pencil")
                    HStack {
                        TextField("Enter your history", text: $title)
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                    }
                    Spacer()
                    Label("Member : ",systemImage: "person.3.sequence")
                    HStack {
                        TextField("Enter a members", text: $member)
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                    }
                    Spacer()
                    Label("Price : ",systemImage: "wonsign.circle")
                    HStack {
                        TextField("Enter a price", text: $price)
                          .padding()
                          .background(Color(uiColor: .secondarySystemBackground))
                    }
                    Spacer()
                }
                .navigationTitle("자산 추가")
                .toolbar {
                    Button(action: {
                        // if you button click
                        AddItemRow()
                        self.presentationMode.wrappedValue.dismiss()
                    }) { // plus button
                        Text("Save")
                    }
                    .accessibilityLabel("New")
                }
            }
            .padding()
            }
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
