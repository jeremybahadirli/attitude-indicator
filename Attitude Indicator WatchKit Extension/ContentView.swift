//
//  ContentView.swift
//  Attitude Indicator WatchKit Extension
//
//  Created by Jeremy Bahadirli on 4/29/21.
//

import SwiftUI

struct ContentView: View {
    
    private let pitchSensitivity: CGFloat = 100
    private let pitchOffset:      CGFloat = 50
    
    @ObservedObject private var gyro = Gyroscope()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .rotationEffect(.radians(gyro.rotation))
                .offset(y: CGFloat(gyro.pitch) * pitchSensitivity + pitchOffset)
            VStack (spacing: 0) {
                Rectangle()
                    .foregroundColor(Color(red: 36/255, green: 40/255, blue: 44/255))
                Image("foreground")
                    .resizable()
                    .scaledToFill()
                Rectangle()
                    .foregroundColor(Color(red: 36/255, green: 40/255, blue: 44/255))
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
