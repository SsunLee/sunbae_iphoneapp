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
    
    var body: some View {
        HStack {
            Button(action: {
                self.showingAlert = true
            }, label:{
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(iconColor)
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("test"))
            }
            
            Spacer()
            
            LogoView()

            Spacer()
            
            Button(action: {}, label:{
                ZStack {
                    Image(systemName: "bell")
                        .font(.title3)
                        .foregroundColor(iconColor)
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10, alignment: .center)
                        .offset(x: 13, y: -10)
                } // zstack
            })
        } // hstack
        
        
    } // body view
    
    var iconColor: Color {
        return colorScheme == .dark ? .white : .black
    }

}

struct TopNaviView_Previews: PreviewProvider {
    static var previews: some View {
        TopNaviView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
