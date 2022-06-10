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
                NavigationLink(destination: Text(cardinfo.title)) {
                    CardView(cardinfo: cardinfo)
                }
                .listRowBackground(cardinfo.theme.mainColor)
            }
        }
        .navigationTitle("Sunbae 의 지출 내역")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New")
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardListView(cardinfos: CardInfoData.sampleData)
        }
        
    }
}
