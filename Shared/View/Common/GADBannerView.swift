//
//  GADBannerView.swift
//  sunbae_app
//
//  Created by riiid on 2022/08/08.
//

import SwiftUI
import UIKit
import GoogleMobileAds


struct BannerAd: UIViewRepresentable {
    //var unitID: String
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> GADBannerView {
        let adView = GADBannerView(adSize: GADAdSizeBanner)
        
        adView.adUnitID = "ca-app-pub-2330147867465531/6622378707"
        adView.rootViewController = UIApplication.shared.getRootViewController()
        adView.load(GADRequest())
        
        return adView
    }
    
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {

    }

    class Coordinator: NSObject, GADBannerViewDelegate {
        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
            print("bannerViewDidReceiveAd")
        }

        func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
            print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
        }

        func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
            print("bannerViewDidRecordImpression")
        }

        func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
            print("bannerViewWillPresentScreen")
        }

        func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
            print("bannerViewWillDIsmissScreen")
        }

        func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
            print("bannerViewDidDismissScreen")
        }
    }
    
}

extension UIApplication {
    func getRootViewController() -> UIViewController {

        guard let screen = self.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }

        return root
    }
}




//struct GADBannerViewController: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> UIViewController {
//        let view = GADBannerView(adSize: GADAdSizeBanner)
//        let viewController = UIViewController()
//
//        view.adUnitID = "ca-app-pub-2330147867465531~8060224084"
//        //view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
//        view.rootViewController = viewController
//        viewController.view.addSubview(view)
//        viewController.view.frame = CGRect(origin: .zero, size: GADAdSizeBanner.size)
//        view.load(GADRequest())
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//}
