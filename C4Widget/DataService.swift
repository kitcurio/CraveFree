//
//  DataService.swift
//  C4WidgetExtension
//
//  Created by Kasia Rivers on 4/4/24.
//

import Foundation
import SwiftUI

struct DataService {
    @AppStorage("tapCount", store: UserDefaults(suiteName: "group.academy.C4Project")) private var tapCount = 0
    
    func log() {
        tapCount += 1
    }
    
    func progress() -> Int {
        return tapCount
    }
}
