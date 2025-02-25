//
//  ContentView.swift
//  YouAreAwesomeNew
//
//  Created by Student2 on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
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
                
                // generate a random messageNumber to use as an index
                // if messageNumber == lastMessageNumber {
                //    keep generating a new random messageNumber
                //    untill you get a messageNumber != lastMessageNumber
                // set messageString to messages[messageNumber]
                // update the lastMesssageNumber with messageNumber
                
                var MessageNumber: Int
                repeat {
                    MessageNumber = Int.random(in: 0...messages.count-1)
                } while MessageNumber == lastMessageNumber
                message = messages[MessageNumber]
                lastImageNumber = MessageNumber
                
//                imageName = "image\(Int.random(in: 0...9))"
                var imageNumber = Int.random(in: 0...9)
                repeat{
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
