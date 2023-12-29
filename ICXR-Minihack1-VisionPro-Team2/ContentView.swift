//
//  ContentView.swift
//  ICXR-Minihack1-VisionPro-Team2
//
//  Created by Jack English on 12/29/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                Image("sample_banner")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150, alignment: .center)
                    .clipped()
                
                HStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle)
                        .padding(.leading, 50)
                        .padding(.top, -50)
                    Spacer()
                }

                Text("Featured")
                    .font(.title)
                    .padding(.top)
                    .padding(.leading, 40)

                Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                    .toggleStyle(.button)
                    .padding(.top, 50)
            }
        }
        Spacer()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview() {
    ContentView()
}
