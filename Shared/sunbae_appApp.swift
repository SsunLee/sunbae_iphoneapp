//
//  sunbae_appApp.swift
//  Shared
//
//  Created by riiid on 2022/06/10.
//

import SwiftUI

@main
struct sunbae_appApp: App {
    var body: some Scene {
        WindowGroup {
            HistoryListView()
                .environmentObject(
                    //CardData(id: UUID(), title: "", member: [], price: "")
                    CardData()
                )
        }
    }
}
