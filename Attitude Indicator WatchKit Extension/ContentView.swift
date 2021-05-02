//
//  ContentView.swift
//  Attitude Indicator WatchKit Extension
//
//  Created by Jeremy Bahadirli on 4/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gyro = Gyroscope()
    
    var body: some View {
        ZStack {
            Image("img261")
                .resizable()
                .rotationEffect(.radians(gyro.rotation))
                .offset(y: CGFloat(gyro.pitch))
            VStack (spacing: 0) {
                Rectangle()
                    .foregroundColor(Color.init(red: 36/255, green: 40/255, blue: 44/255))
                Image("img259")
                    .resizable()
                    .scaledToFill()
                Rectangle()
                    .foregroundColor(Color.init(red: 36/255, green: 40/255, blue: 44/255))
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
