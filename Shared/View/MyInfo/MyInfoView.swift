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
    
    var commOption: commonOption
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            List {
                Picker(selection: $csManager.colorScheme, label: Text("화면 테마 설정").font(.subheadline)) {
                    Text(ColorValues[0]).tag(ColorScheme.unspecified)
                    Text(ColorValues[1]).tag(ColorScheme.dark)
                    Text(ColorValues[2]).tag(ColorScheme.light)
                }
                Button(action: {
                    if let url = URL(string: "itms-apps://apple.com/app/id1635593176") {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    HStack {
                        Text("앱 버전")
                            .font(.subheadline)
                        Spacer()
                        Text(getVersionString)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(5)
                    }
                })
            } // list
        } // Vstack
    }
    var getVersionString: String {
        var returnStr: String = ""
        if let _ver = commOption.version {
            returnStr = _ver
        }
        else {
            returnStr = "Nothing"
        }
        return returnStr
        
    }
}


struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView(commOption: commonOption())
            .environmentObject(ColorSchemeManager())
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
