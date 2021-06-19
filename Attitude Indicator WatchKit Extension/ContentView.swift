//
//  ContentView.swift
//  Attitude Indicator WatchKit Extension
//
//  Created by Jeremy Bahadirli on 4/29/21.
//

import SwiftUI

struct ContentView: View {
        
    @ObservedObject private var gyro          = Gyroscope()
    @State          private var offset: Float = 0.0
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .rotationEffect(-.radians(gyro.rotation))
                .offset(y: CGFloat(gyro.pitch) + CGFloat(offset))
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
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .focusable(true)
        .digitalCrownRotation($offset, from: -60.0, through: 60.0, sensitivity: .medium)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
