//
//  TabNaviView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI
import GoogleMobileAds

struct TabNaviView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var myInfo: String = "내 정보"
    var isBarHidden: Bool = false
    @State private var searchText: String = ""
    @State private var fillText : String = ""
    

    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    TopNaviView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, getSafeAreaTop())
                        .background(NaviColor)
                    
                    TabView {
                        AssetsView(commonOption: commonOption())
                            //.environmentObject(CardData())
                            .tabItem {
                                Image(systemName: "dollarsign.circle")
                                Text("자산")
                                    .font(.subheadline.bold())
                            }
                        DutchPayView(commonOption: commonOption())
                            .tabItem {
                                Image(systemName: "circle.grid.cross")
                                Text("더치페이(단건)")
                                    .font(.subheadline.bold())
                            }
                        DutchView(commonOption: commonOption())
                            .tabItem {
                                Image(systemName: "circle.grid.cross")
                                Text("더치페이(여러개)")
                                    .font(.subheadline.bold())
                            }
                        MyInfoView(commOption: commonOption())
                            .tabItem {
                                Image(systemName: "info.circle")
                                Text(myInfo)
                                    .font(.subheadline.bold())
                            }
                    }.edgesIgnoringSafeArea(.top)
                    VStack {
                        HStack {
                            Spacer()
                            GADBannerViewController().frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                            Spacer()
                        }
                    }
                } // Vstack
            } // Zstack
            .ignoresSafeArea(.all, edges: .top)
        } // navi
        .navigationViewStyle(StackNavigationViewStyle())
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
