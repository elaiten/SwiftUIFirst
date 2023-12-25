//
//  CategoryItem.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI

struct CategoryItem: View {
    var landmarks: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmarks.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155,height: 155)
                .cornerRadius(5)
                
            Text(landmarks.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmarks: ModelData().landmarks[0])
    }
}
