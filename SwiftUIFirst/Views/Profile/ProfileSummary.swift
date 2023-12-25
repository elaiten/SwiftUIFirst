//
//  ProfileSummary.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI

struct ProfileSummary: View {
    
    var profile: Profile
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10){
                Text(profile.username)
                    .font(.title)
                    .bold()
                
                Text("Profile \(profile.username)")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
            
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.defaultProfile)
    }
}
