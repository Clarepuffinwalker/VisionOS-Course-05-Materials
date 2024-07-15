//
//  VisionOS_Course_05_MaterialsApp.swift
//  VisionOS Course 05 Materials
//
//  Created by ClareZhou on 2024/7/9.
//

import SwiftUI

@main
struct VisionOS_Course_4_MaterialsApp: App {
    
    @State private var currentImmersionStyle: ImmersionStyle = .progressive
    
    var body: some Scene {
        WindowGroup(id:"Home") {
            ContentView()
        }
        
        WindowGroup(id:"Video") {
            VideoView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id:"Material") {
            MaterialTypeView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id:"Matrix") {
            MatrixView()
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id:"Skybox") {
            SkyboxView()
        }
        .immersionStyle(selection: $currentImmersionStyle, in: .mixed,.progressive,.full)
    }
}
