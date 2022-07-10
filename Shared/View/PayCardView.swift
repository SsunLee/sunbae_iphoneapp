//
//  PayCardView.swift
//  sunbae_app (iOS)
//
//  Created by Sunbae lee on 2022/07/10.
//

import SwiftUI

struct PayCardView: View {
    @EnvironmentObject var cards: CardData
    var paycard = PayCardFunctions()
    
    var body: some View {
        ForEach(cards.cardinfos, id: \.id) { card in
            NavigationLink(destination: WalletDetailView(card: card)) {
                HStack(spacing: 5) {
                    Image("star")
                        .padding(1)
                }
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(card.title)
                            .font(.subheadline.bold())
                        .minimumScaleFactor(0.5)
                        Spacer()
                        Text(card.payType)
                            .font(.subheadline)
                            .frame(width: 40, height: 15, alignment: .center)
                            .padding(5)
                            .foregroundColor(.white)
                            .background(paycard.payTypeColor(payTypeString: card.payType))
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    }
                    HStack {
                        Label(card.member.joined(separator: ", "), systemImage: "person.3")
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
        .onDelete(perform: cards.delete)
        .onMove(perform: cards.move)
    }
}
