//
//  LandmarkRow.swift
//  SwiftUIFirst
//
//  Created by Руслан on 18.12.2023.
//

import SwiftUI

struct LandmarkRow: View {

    let landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
            Text(landmark.name)
            
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks = ModelData().landmarks
        VStack {
            return Group {
                LandmarkRow(landmark: landmarks[0])
            }
        }
    }
}

