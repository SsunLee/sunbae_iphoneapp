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
    //@EnvironmentObject var csManager: ColorSchemeManager
    @State private var selectedColorIndex = 0
    
    var commOption: commonOption = commonOption()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            List {
                NavigationLink(destination: ThemeView()) {
                    HStack {
                        Text("화면 테마 설정")
                        Spacer()
                        Text(getColorString)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(5)
                    }

                }

                Button(action: {
                    if let url = URL(string: "itms-apps://apple.com/app/id1635593176") {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    HStack {
                        Text("앱 버전")
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
    var backColor: Color {
        return colorScheme == .dark ? .black : .white
    }
    var getColorString: String {
        var tempStr: String = ""
        switch colorScheme {
        case .light:
            tempStr = "Light Mode"
        case .dark:
            tempStr = "Dark Mode"
        default:
            tempStr = "기기 설정 동일"
        }
        return tempStr
    }
}


struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
            .environmentObject(ColorSchemeManager())
    }
}
