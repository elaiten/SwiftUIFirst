//
//  FeatureCard.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI

struct FeatureCard: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay
        {
            TextOverlay(landmark: landmark)
        }
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(colors: [.black.opacity(0.6), .black.opacity(0)],
                        startPoint: .bottom,
                        endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().feature[1])
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}


