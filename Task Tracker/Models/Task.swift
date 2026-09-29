//
//  Task.swift
//  Task Tracker
//
//  Created by MARYANN KIMANI on 28/09/2026.
//

import Foundation

// Swift Data is a premier way of saving data for Apple
import SwiftData

@Model
class Task {
    var id = UUID()
    var title: String
    var isDone: Bool = false
    
    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}
