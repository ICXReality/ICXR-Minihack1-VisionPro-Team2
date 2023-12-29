//
//  ICXR_Minihack1_VisionPro_Team2App.swift
//  ICXR-Minihack1-VisionPro-Team2
//
//  Created by Jack English on 12/29/23.
//

import SwiftUI

@main
struct ICXR_Minihack1_VisionPro_Team2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 300, height: 300))

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
