//
//  LandmarkDetail.swift
//  SwiftUIFirst
//
//  Created by Руслан on 21.12.2023.
//

import SwiftUI


struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark


    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {

        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .offset(y: -100)
                .ignoresSafeArea()


            CircleImage(image: landmark.image)
                .offset(y: -200)
                .padding(.bottom, -200)


            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
       
    }
}
