//
//  ContentView.swift
//  Attitude Indicator WatchKit Extension
//
//  Created by Jeremy Bahadirli on 4/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var gyro                  = Gyroscope()
    @State          private var crownAdjust:   Double = 0.0
    
    private var adjustedPitch: Double {
        gyro.pitch + crownAdjust
    }
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .rotationEffect(.radians(-gyro.rotation))
                .offset(
                    x: CGFloat(sin(gyro.rotation) * adjustedPitch),
                    y: CGFloat(cos(gyro.rotation) * adjustedPitch)
                )
            VStack (spacing: 0) {
                Rectangle()
                    .foregroundColor(Color(red: 36/255, green: 40/255, blue: 44/255))
                Image("Foreground")
                    .resizable()
                    .scaledToFill()
                Rectangle()
                    .foregroundColor(Color(red: 36/255, green: 40/255, blue: 44/255))
                
            }
        }
        .focusable(true)
        .digitalCrownRotation($crownAdjust, from: -60.0, through: 60.0, sensitivity: .medium)
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
