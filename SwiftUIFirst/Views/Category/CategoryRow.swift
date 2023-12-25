//
//  CategoryRow.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 15)
            
            ScrollView( .horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmarks in
                        NavigationLink {
                            LandmarkDetail(landmark: landmarks)
                        }
                    label:
                        {
                            CategoryItem(landmarks: landmarks)
                        }
                    }
                }
            }
            .frame(height: 187)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let landmarks = ModelData().landmarks
        CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
    }
}

