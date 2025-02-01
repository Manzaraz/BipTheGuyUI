//
//  ContentView.swift
//  BipTheGuyUI
//
//  Created by Christian Manzaraz on 01/02/2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    playSound(soundName: "punchSound")
                }
            
            Spacer()
            
            Button {
                // TODO: Button action here
                
            } label: {
                Label(
                    "Photo Library",
                    systemImage: "photo.fill.on.rectangle.fill"
                )
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("🤬ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

#Preview {
    ContentView()
}
