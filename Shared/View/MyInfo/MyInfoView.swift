//
//  MyInfoView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI

struct MyInfoView: View {
    var isOn: Bool = false
    var ColorValues = ["기기 설정 동일", "Dark Mode", "Light Mode"]
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var csManager: ColorSchemeManager
    @State private var selectedColorIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
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
            .background(backColor)
        } // Vstack
        
    }
                        
    var backColor: Color {
        return colorScheme == .dark ? .black : .white
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
            .environmentObject(ColorSchemeManager())
    }
}
