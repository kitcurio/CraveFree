//
//  DataService.swift
//  WidgetExtension
//
//  Created by Kasia Rivers on 2/1/24.
//

import Foundation
import SwiftUI

struct DataService {
    @AppStorage("tapCount", store: UserDefaults(suiteName: "group.academy.CraveFree")) private var tapCount = 0
    
    func log() {
        tapCount += 1
    }
    
    func progress() -> Int {
        return tapCount
    }
}
