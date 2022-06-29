//
//  FixedPayAreaView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/29.
//

import SwiftUI

struct FixedPayAreaView: View {
@EnvironmentObject var card: CardData
    
    var body: some View {
        HStack {
            Button(action: {
                //
            }, label: {
                //Text("가용 금액 : 444,000")
                Text("가용 금액 : \(card.getCurrentBalence())")
                    .font(.title3.bold())
            })
            .frame(width: .infinity, height: 7, alignment: .leading)
            .padding()
            .accentColor(.white)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        }.padding()
    }
}

struct FixedPayAreaView_Previews: PreviewProvider {
    static var previews: some View {
        FixedPayAreaView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
