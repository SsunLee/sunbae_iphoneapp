//
//  ThemeView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/24.
//

import SwiftUI

struct ThemeView: View {
    var body: some View {
        VStack{
            List {
                Text("기기 설정 동일")
                Text("다크 모드")
                Text("라이트 모드")
            }
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
