//
//  WalletListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/26.
//

import SwiftUI

struct WalletListView: View {
    
    @EnvironmentObject var card: CardData
    
    var body: some View {
        if card.cardinfos.count != 0 {
            ForEach(card.cardinfos, id: \.id) { card in
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(card.title)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        Spacer()
                        Text(card.payType)
                            .font(.subheadline)
                            .frame(width: 40, height: 7, alignment: .center)
                            .padding()
                            .foregroundColor(.white)
                            .background(payTypeColor(payTypeString: card.payType))
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    }
                    HStack {
                        Label(card.member.joined(separator: ", "), systemImage: "person.3.sequence")
                            .font(.subheadline)
                    }
                    HStack {
                        Text(card.insertDate)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Label(String(card.price), systemImage: "wonsign.circle")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                }
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
        }
    }
    
    func delete(indexSet: IndexSet) {
        card.cardinfos.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffset: Int) {
        card.cardinfos.move(fromOffsets: indices, toOffset: newOffset)
    }

    func payTypeColor(payTypeString: String) -> Color {
        
        if payTypeString == "수입" {
            return Color.blue
        } else {
            return Color.red
        }
    }
    
}
 
        
struct WalletListView_Previews: PreviewProvider {
    static var previews: some View {
        WalletListView()
    }
}
