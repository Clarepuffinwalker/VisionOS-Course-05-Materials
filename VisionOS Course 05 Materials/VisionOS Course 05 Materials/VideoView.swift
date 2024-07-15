//
//  VideoView.swift
//  VisionOS Course 05 Materials
//
//  Created by ClareZhou on 2024/7/9.
//

import SwiftUI
import RealityKit
import AVKit
import AVFoundation

struct VideoView: View {
    var body: some View {
        
        RealityView {content in
            //video material call
            if let videoMaterial = generateVideoMaterial() {
                
            //load TV
            guard let tv = try? await Entity(named:  "tv_retro-edited") else {
                print("model not loading")
                return }
            print("model loaded")
            tv.position = SIMD3<Float>(0,-0.05,0)
            let scaleFactor: Float = 0.004
            tv.scale = [scaleFactor,scaleFactor,scaleFactor]
            content.add(tv)
                
                //load TV panel
                let panel = ModelEntity(
                    mesh:.generatePlane(width: 0.22, height: 0.17, cornerRadius: 0.02),
                    materials: [videoMaterial]
                )
                panel.position = [-0.0325,0.06,0.09]
                content.add(panel)
            }
        }
    }
}
    
    //video material
    @MainActor
func generateVideoMaterial() -> VideoMaterial? {
    // Correct URL for the video resource
    guard let url = Bundle.main.url(forResource: "Museas", withExtension: "mov") else {
        print("Error loading video")
        return nil
    }
    
    let avPlayer = AVPlayer(url: url)
    let videoMaterial = VideoMaterial(avPlayer: avPlayer)
    avPlayer.play()
    return videoMaterial
}

#Preview {
    VideoView()
}
