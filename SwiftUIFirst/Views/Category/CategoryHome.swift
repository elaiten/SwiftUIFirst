//
//  CategoryHome.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.feature.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.category.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.category[key]!)
                }
                .listRowInsets(.init(top: 10,
                                     leading: 0,
                                     bottom: 0,
                                     trailing: 0))
            }
            
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }            
            }
           
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
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
