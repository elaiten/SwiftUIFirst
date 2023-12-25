//
//  ProfileEditor.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dataRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(bySetting: .year, value: 1, of: profile.goalDate)!
        return min...max
    }
    var body: some View {
        List {
            HStack {
                Text("User Name")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                    
                }
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.defaultProfile))
    }
}
