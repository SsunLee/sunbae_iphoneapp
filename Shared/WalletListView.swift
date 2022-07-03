//
//  WalletListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/26.
//

import SwiftUI

struct WalletListView: View {
    
    @EnvironmentObject var cards: CardData
    
    var body: some View {
        if cards.cardinfos.count != 0 {
            ForEach(cards.cardinfos, id: \.id) { card in
                NavigationLink(destination: WalletDetailView(card: card)) {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(card.title)
                                .font(.subheadline)
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
                            Label(setNumberFormatter(strPrice: card.price), systemImage: "wonsign.circle")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            
                        } // hstack
                    } // vastck
                }

            } // foreach
            .onDelete(perform: delete)
            .onMove(perform: move)
        } // cardinfos


        
    } // body view
    func setNumberFormatter(strPrice: String) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let _price = Int(strPrice)
        let result = numberFormatter.string(for: _price)!
        
        return result
    }
    
    func delete(indexSet: IndexSet) {
        cards.cardinfos.remove(atOffsets: indexSet)
    }
    func move(indices: IndexSet, newOffset: Int) {
        cards.cardinfos.move(fromOffsets: indices, toOffset: newOffset)
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
