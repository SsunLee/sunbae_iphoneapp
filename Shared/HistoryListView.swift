//
//  HistoryListView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/13.
//

import SwiftUI

struct HistoryListView: View {
    
    @EnvironmentObject var card: CardData
    @ObservedObject var vm = HideBarViewModel()

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
                        }.navigationBarHidden(vm.isHidden)
                    }.padding().shadow(radius: 2)
                } // Vstack
            } // Zstack
        } // VanigationVeiw
        .navigationBarTitle("", displayMode: .inline)
        //.edgesIgnoringSafeArea(.top)
        .environmentObject(vm)
    } // body View
} // struct view

class HideBarViewModel: ObservableObject {
    @Published var isHidden = true
}

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
