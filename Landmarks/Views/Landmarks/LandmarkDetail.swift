//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//

import SwiftUI

// Tampilan untuk detail landmark, menampilkan informasi lengkap tentang suatu landmark.
struct LandmarkDetail: View {
    // Lingkungan untuk mengakses data dari ModelData.
    @Environment(ModelData.self) var modelData
    
    // Data landmark yang akan ditampilkan detailnya.
    var landmark: Landmark

    // Index landmark dalam ModelData.
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        // Menggunakan @Bindable untuk mengikat modelData ke environment.
        @Bindable var modelData = modelData
        
        ScrollView {
            // Menampilkan peta dengan koordinat landmark.
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            // Menampilkan gambar lingkaran landmark di atas peta.
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                // Judul dan tombol favorit.
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                // Informasi tambahan tentang lokasi landmark.
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                // Deskripsi tentang landmark.
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

#Preview {
    // Membuat ModelData untuk preview.
    let modelData = ModelData()
    // Menampilkan preview LandmarkDetail dengan landmark pertama dari ModelData.
    return LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(modelData)
}

