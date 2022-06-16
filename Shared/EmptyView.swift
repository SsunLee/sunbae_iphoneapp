//
//  EmptyView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/15.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        NavigationLink(destination: AddItemView()){
            VStack(alignment: .center, spacing: 10){
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
                Text("please click the button")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding()
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
