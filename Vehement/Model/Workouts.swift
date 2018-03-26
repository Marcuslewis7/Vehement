//
//  Workouts.swift
//  Vehement
//
//  Created by Marcus Lewis on 24/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import Foundation

struct Workout {
    
    private(set) public var title: String
    private(set) public var imageName: String
    private(set) public var timeLength: String
    private(set) public var videoCode: String
    
    init(title: String, imageName: String, timeLength: String, videoCode: String) {
        self.title = title
        self.imageName = imageName
        self.timeLength = timeLength
        self.videoCode = videoCode
    }
}
