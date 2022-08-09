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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var ColorValues = ["기기 설정 동일", "Dark Mode", "Light Mode"]
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("앱 설정")
                    .font(.headline.bold())
                    .foregroundColor(Color.accentColor)
                    ) {
                    Picker(selection: $csManager.colorScheme, label: Text("화면 테마 설정")) {
                        Text(ColorValues[0]).tag(ColorScheme.unspecified)
                        Text(ColorValues[1]).tag(ColorScheme.dark)
                        Text(ColorValues[2]).tag(ColorScheme.light)
                    }
                }.padding()

            }
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
            //.environmentObject(ColorSchemeManager)
    }
}
