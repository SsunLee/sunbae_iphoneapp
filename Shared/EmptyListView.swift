//
//  EmptyView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/15.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        NavigationLink(destination: AddItemView()){
            VStack(alignment: .center, spacing: 10){
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
                Text("지출 추가하기")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding()
                .frame(maxWidth: .infinity)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
