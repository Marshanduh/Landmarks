//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Definisikan tampilan LandmarkDetail
struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData // Environment untuk data model
    var landmark: Landmark // Landmark yang akan ditampilkan detailnya

    // Hitung indeks landmark dalam modelData
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        @Bindable var modelData = modelData// Binding untuk modelData
        
        // Tampilan detail landmark dalam ScrollView
        ScrollView {
            VStack {
                // Gambar landmark dalam bentuk lingkaran
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()

                // nama landmark
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)

                // Toggle untuk menambah/menghapus landmark dari daftar favorit
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }


                Divider()

                // Nama taman tempat landmark berada
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)

                // Nama negara bagian tempat landmark berada
                Text(landmark.state)
                    .font(.caption)


                Divider()

                // Tampilan peta menampilkan lokasi landmark
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

// Pratinjau tampilan LandmarkDetail dengan menggunakan ModelData environment
#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
