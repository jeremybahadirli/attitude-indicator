//
//  Gyroscope.swift
//  Attitude Indicator WatchKit Extension
//
//  Created by Jeremy Bahadirli on 4/30/21.
//

import CoreMotion

class Gyroscope: ObservableObject {

    private var motionManager: CMMotionManager

    @Published var rotation: Double = 0
    @Published var pitch:    Double = 0
    
    private let pitchSensitivity: Double = 100
    private let pitchOffset:      Double = 50

    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.deviceMotionUpdateInterval = 1/60
        self.motionManager.startDeviceMotionUpdates(to: .main) { (motion, error) in
            guard error == nil else {
                print(error!)
                return
            }
            self.rotation = atan2(motion!.gravity.x, -motion!.gravity.y)
            self.pitch = motion!.gravity.z * self.pitchSensitivity + self.pitchOffset
        }
    }
}
