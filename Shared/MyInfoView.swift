//
//  MyInfoView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI

struct MyInfoView: View {
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
            Spacer()

            
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
