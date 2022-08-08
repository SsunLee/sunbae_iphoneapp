//
//  HistoryListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/13.
//

import SwiftUI
import GoogleMobileAds

struct AssetsView: View {
    
    @EnvironmentObject var cards: CardData
    @State private var searchText = ""
    var commonOption: commonOption

    var body: some View {
        ZStack {
            VStack {
                    //.shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                List {
                    if cards.cardinfos.count != 0 {
                        PayCardView()
                    } else {
                        EmptyListView()
                    }
                } // list
                .listStyle(.plain)
                .navigationBarHidden(true)// navigationLink
                .navigationBarTitle("", displayMode: .inline)
            } // Vstack
        VStack {
            Spacer()
            HStack{
                Spacer()
                NavigationLink(destination: AddItemView()) {
                    Image(systemName: "plus")
                        .font(.subheadline)
                        .frame(width:30, height: 30)
                        .background(Color.green)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }.padding()
            } // Vstack
            VStack {
                Spacer()
                HStack {
                    FixedPayAreaView() // 가용금액
                    Spacer()
                }
            }

        } // Zstack

        //
        //.edgesIgnoringSafeArea(.top)
    } // body View
    
} // struct view

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView(commonOption: commonOption())
            .environmentObject(CardData())
    }
}
