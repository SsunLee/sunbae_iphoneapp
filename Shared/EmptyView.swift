//
//  EmptyView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/12.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "plus.circle.fill")
                
            Text("Please click the button")
                .font(.system(size: 18).bold())
                .foregroundColor(Color.gray)
            
        }.frame(alignment: .center)
        
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
            .background(Color.white)
            .previewLayout(.fixed(width: 1000, height: 60))
    }
}
