//
//  LogoView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/27.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Text("Sun".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            Image("sun")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("Bae".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
