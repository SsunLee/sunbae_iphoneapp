//
//  HistoryListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/13.
//

import SwiftUI

struct HistoryListView: View {
    
    @EnvironmentObject var card: CardData

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List() {
                        if card.cardinfos.count != 0 {
                            WalletListView()
                        } else {
                            EmptyListView()
                        }
                    }
                }
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
                    }.padding().shadow(radius: 2)
                } // Vstack
            } // Zstack
        } // VanigationVeiw
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    } // body View
} // struct view

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}


struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView()
    }
}
