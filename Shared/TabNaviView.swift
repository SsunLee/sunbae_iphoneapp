//
//  TabNaviView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI

struct TabNaviView: View {
    @State var myInfo: String = "내 정보"
    
    
    var body: some View {
        TabView {
            HistoryListView()
                .environmentObject(CardData())
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("자산")
                }
            Text("Main")
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            MyInfoView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text(myInfo)
                }
        }
    }
}

struct TabNaviView_Previews: PreviewProvider {
    static var previews: some View {
        TabNaviView()
    }
}
