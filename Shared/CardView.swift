//
//  CardView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI

struct CardView: View {
    let cardinfo: CardInfoData
    var body: some View {
        VStack(alignment: .leading) {
            Text(cardinfo.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(cardinfo.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(cardinfo.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(cardinfo.theme.accentColro)
    }
}

struct CardView_Previews: PreviewProvider {
    static var cardinfo = CardInfoData.sampleData[0]
    static var previews: some View {
        CardView(cardinfo: cardinfo)
            .background(cardinfo.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
