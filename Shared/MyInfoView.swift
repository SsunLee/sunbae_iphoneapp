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
    @EnvironmentObject var csManager: ColorSchemeManager
    @State private var selectedColorIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("내 정보")
                .font(.headline.bold())
                .foregroundColor(Color.accentColor)
                .padding()
            HStack{
                Label("이름", systemImage: "person")
                    .font(.subheadline)
                    .padding()
                Spacer()
                Text("sunbae.lee")
                    .padding()
            } // Hstack
            Divider()
            HStack{
                Label("Email", systemImage: "envelope")
                    .font(.subheadline)
                    .padding()
                Spacer()
                Text("tnsqo1126@naver.com")
                    .padding()
            } // Hstack
            Divider()

            VStack(alignment: .leading, spacing: 10){
                Text("앱 설정")
                    .font(.headline.bold())
                    .foregroundColor(Color.accentColor)
                    .padding()
                //Form {
                    Section {
                        Picker(selection: $csManager.colorScheme, label: Text("화면 테마 설정")) {
                            Text(ColorValues[0]).tag(ColorScheme.unspecified)
                            Text(ColorValues[1]).tag(ColorScheme.dark)
                            Text(ColorValues[2]).tag(ColorScheme.light)
                        }
                    }.padding()
               // }
            } // Vstck
            Divider()
            Spacer()
        } // Vstack
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
