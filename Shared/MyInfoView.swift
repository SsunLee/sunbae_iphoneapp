//
//  MyInfoView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI

struct MyInfoView: View {
    var isOn: Bool = false
    var ColorValues = ["기기 설정 동일", "다크모드", "라이트모드"]
    @EnvironmentObject var csManager: ColorSchemeManager
    @State private var selectedColorIndex = 0
    
    var body: some View {
        NavigationView {
            
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
                }
                Divider()
                HStack{
                    Label("Email", systemImage: "envelope")
                        .font(.subheadline)
                        .padding()
                    Spacer()
                    Text("tnsqo1126@naver.com")
                        .padding()
                }
                Divider()

                VStack(alignment: .leading, spacing: 10){
                    Text("앱 설정")
                        .font(.headline.bold())
                        .foregroundColor(Color.accentColor)
                        .padding()
                    //Form {
                        Section {
                            Picker(selection: $csManager.colorScheme, label: Text("화면 테마 설정")) {
                                Text("기기 설정 동일").tag(ColorScheme.unspecified)
                                Text("Dark Mode").tag(ColorScheme.dark)
                                Text("Light Mode").tag(ColorScheme.light)
                            }
                        }.padding()
                   // }
                }
                Divider()
                Spacer()
            }
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
