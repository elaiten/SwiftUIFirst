//
//  ProfileSummary.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.summer
    var goalDate = Date()
    
    static let defaultProfile = Profile(username: "Ruslan")
    
    enum Season: String, Identifiable, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}


