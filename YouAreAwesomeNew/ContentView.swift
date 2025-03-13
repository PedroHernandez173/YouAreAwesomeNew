//
//  ContentView.swift
//  YouAreAwesomeNew
//
//  Created by Student2 on 2/10/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10
    let numberOfSound = 6
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()

            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message!") {
                let messages = ["You Are Awesome!",
                                "Gazoooks my friend! I am astonished at how utterly magnificent you are!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great!",
                                "You Are Fantastic!",
                                "Fabulous? That's You!",
                                "You Make Me Smile!",]
                
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                message = messages[lastMessageNumber]
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                imageName = "image\(lastImageNumber)"

                
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSound-1)
                playsSound(soundName: "sound\(lastSoundNumber)")
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playsSound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creatingaudioPlayer")
        }
    }
}

#Preview {
    ContentView()
}
