//
//  ContentView.swift
//  sunbae
//
//  Created by riiid on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CirclsImage()
                .offset(y: -80)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("sunbae lee")
                    .font(.title)
                    .foregroundColor(.green)
                .padding()
                HStack {
                    Text("riiid")
                        .font(.subheadline)
                    Spacer()
                    Text("test test")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                
                Text("About Turtle")
                    .font(.title2)
                Text("Descriptive text")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
