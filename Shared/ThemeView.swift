//
//  ThemeView.swift
//  sunbae_app
//
//  Created by Sunbae lee on 2022/06/24.
//

import SwiftUI

struct ThemeView: View {
    @Environment(\.colorScheme) var current
    @EnvironmentObject var csManager: ColorSchemeManager
    
    var body: some View {
        VStack{
            
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
            //.environmentObject(ColorSchemeManager)
    }
}
