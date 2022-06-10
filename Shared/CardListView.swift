//
//  CardListView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI

struct CardListView: View {
    let cardinfos: [CardInfoData]
    
    var body: some View {
        List {
            ForEach(cardinfos, id: \.title) { cardinfo in
                CardView(cardinfo: cardinfo)
                    .listRowBackground(cardinfo.theme.mainColor)
            }
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(cardinfos: CardInfoData.sampleData)
    }
}
