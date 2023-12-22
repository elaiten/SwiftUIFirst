//
//  SwiftUIFirstApp.swift
//  SwiftUIFirst
//
//  Created by Руслан on 18.12.2023.
//

import SwiftUI

@main
struct SwiftUIFirstApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
