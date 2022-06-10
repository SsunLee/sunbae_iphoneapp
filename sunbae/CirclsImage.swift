//
//  CirclsImage.swift
//  sunbae
//
//  Created by riiid on 2022/06/09.
//

import SwiftUI

struct CirclsImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth:4)
            }
            .shadow(radius: 7)
    }
}

struct CirclsImage_Previews: PreviewProvider {
    static var previews: some View {
        CirclsImage()
    }
}
