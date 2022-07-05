//
//  TopNaviView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/27.
//

import SwiftUI

struct TopNaviView: View {
    @Environment(\.colorScheme) var colorScheme
    //@State private var isAnimated: Bool = false
    
    
    var body: some View {
        HStack {
            Button(action: {}, label:{
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(iconColor)
            })
            
            Spacer()
            
            LogoView()
//                .opacity(isAnimated ? 1 : 0)  // 투명도
//                .offset(x: 0, y: isAnimated ? 0 : -10) //
//                .onAppear(perform: {
//                    withAnimation(.easeOut(duration: 0.5)) {
//                        isAnimated.toggle()
//                    }
//                })
            
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
                    
                }
            })
        }
    }
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
