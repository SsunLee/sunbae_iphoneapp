//
//  TabNaviView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI

struct TabNaviView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var myInfo: String = "내 정보"
    var isBarHidden: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TopNaviView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, getSafeAreaTop())
                    .background(NaviColor)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                Spacer()
                
                TabView {
                    HistoryListView()
                        //.environmentObject(CardData())
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
                }.edgesIgnoringSafeArea(.top)
            } // Vstack
        } // Zstack
        .ignoresSafeArea(.all, edges: .top)
    } // Body View
    
    var NaviColor: Color {
        return colorScheme == .dark ? .black : .white
    }
} // Struct

func getSafeAreaTop() -> CGFloat {
    let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    return (keyWindow?.safeAreaInsets.top)!
}

struct TabNaviView_Previews: PreviewProvider {
    static var previews: some View {
        TabNaviView()
    }
}
