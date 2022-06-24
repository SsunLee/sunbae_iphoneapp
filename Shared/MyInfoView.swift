//
//  MyInfoView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI

struct MyInfoView: View {
    var isOn: Bool = false
    
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
            Text("앱 설정")
                .font(.headline.bold())
                .foregroundColor(Color.accentColor)
                .padding()
            VStack{
                HStack {
                    NavigationLink(destination: ThemeView()){
                        Label("화면테마설정", systemImage: "paintpalette")
                            .font(.subheadline)
                        .padding()
                        Spacer()
                    }

                }
                Divider()
            }
            Spacer()

            
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
