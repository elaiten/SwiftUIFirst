//
//  CategoryHome.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        NavigationSplitView {
            List {
                Image("mountain")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.category.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.category[key]!)
                }
                .listRowInsets(EdgeInsets())
            }

            .navigationTitle("Featured")
        } detail: {
            Text("Choose a Landmark")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    let modelData = ModelData()
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
