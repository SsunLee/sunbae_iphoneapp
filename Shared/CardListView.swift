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
            if 0 != 0 {
                ForEach(cardinfos, id: \.title) { cardinfo in
                    NavigationLink(destination: Text(cardinfo.title)) {
                        CardView(cardinfo: cardinfo)
                    }
                    .listRowBackground(cardinfo.theme.mainColor)
                }
            } else {
                EmptyView()
                    
            }

        }
        .navigationTitle("Sunbae 의 지출 내역")
        .toolbar {
            Button(action: {
                // if you button click
            }) { // plus button
                Image(systemName: "plus")
            }
            .accessibilityLabel("New")
        }
    }
 
    
    func clickToItem() {
        
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            CardListView(cardinfos: CardInfoData.sampleData)
            
        }
        
    }
}
