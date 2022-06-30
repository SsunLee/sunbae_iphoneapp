//
//  SplashView.swift
//  sunbae_app
//
//  Created by riiid on 2022/06/21.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    
    @State private var isAnimated: Bool = false
    
    var repeatingAnimation: Animation {
        Animation
            .linear(duration: 2)
            .repeatForever()
            .delay(0.5)
    }
    
    var body: some View {
        VStack {
            if self.isActive {
                TabNaviView()
            } else {
                LogoView()
                    .opacity(isAnimated ? 1 : 0)
                    .offset(x: 0, y: isAnimated ? 0 : -25)
                    .onAppear(perform: {
                        withAnimation(self.repeatingAnimation) {
                            isAnimated.toggle()
                        }
                    })
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}



struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
