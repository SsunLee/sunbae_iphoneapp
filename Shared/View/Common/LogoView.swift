//
//  LogoView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/27.
//

import SwiftUI

struct LogoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Text("Ssun".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(LogoColor)
            Image("sun_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                .border(.gray, width: 1)
                .cornerRadius(1)
            
            Text("Pay".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(LogoColor)
        }
    } // body
    
    var LogoColor: Color {
        return colorScheme == .dark ? .white : .black
    }
    
} // struct


struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
