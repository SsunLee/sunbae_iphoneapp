//
//  TopNaviView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/27.
//

import SwiftUI

struct TopNaviView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showingAlert = false
    
    @EnvironmentObject var csManager: ColorSchemeManager
    var ColorValues = ["기기 설정 동일", "Dark Mode", "Light Mode"]
    
    var body: some View {
        
        HStack {
//            Button(action: {
//                self.showingAlert = true
//            }, label:{
//                Image(systemName: "magnifyingglass")
//                    .font(.title3)
//                    .foregroundColor(iconColor)
//            })
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text("test"))
//            }
            
            Spacer()
            
            LogoView()

            Spacer()
            
//            Button(action: {
//
//            }, label:{
//                Image(systemName: "sun.max")
//                    .font(.title3)
//                    .foregroundColor(iconColor)
//            })
        } // hstack
        
        
    } // body view
    
    var iconColor: Color {
        return colorScheme == .dark ? .white : .black
    }
//    var randomView: some View {
//        HStack {
//            Picker(selection: $csManager.colorScheme, label: Text("화면 테마 설정")) {
//                Text(ColorValues[0]).tag(ColorScheme.unspecified)
//                Text(ColorValues[1]).tag(ColorScheme.dark)
//                Text(ColorValues[2]).tag(ColorScheme.light)
//            }
//            .pickerStyle(.automatic)
//        }
//    }
}

struct TopNaviView_Previews: PreviewProvider {
    static var previews: some View {
        TopNaviView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(ColorSchemeManager())
    }
}
