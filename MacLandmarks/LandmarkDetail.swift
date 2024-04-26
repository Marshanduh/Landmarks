//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Marshanda Gwie on 22/04/24.
//

import SwiftUI


import SwiftUI
import MapKit

// Definisikan tampilan LandmarkDetail
struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData // Environment untuk data model
    var landmark: Landmark // Landmark yang akan ditampilkan detailnya


    // Hitung indeks landmark dalam modelData
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    
    var body: some View {
        @Bindable var modelData = modelData // Binding untuk modelData
        
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                // Tampilkan peta dengan lokasi landmark
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)

                // Tombol untuk membuka lokasi landmark di aplikasi Maps
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }


            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    // Tampilkan gambar landmark dalam bentuk lingkaran
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)


                    VStack(alignment: .leading) {
                        HStack {
                            // Tampilkan nama landmark
                            Text(landmark.name)
                                .font(.title)
                            // Tombol favorit untuk menandai atau menghapus tanda favorit
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }


                        VStack(alignment: .leading) {
                            // Tampilkan nama taman dan negara bagian
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }


                Divider()

                // Tampilkan deskripsi tentang landmark
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

// Pratinjau tampilan LandmarkDetail dengan menggunakan ModelData environment
#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
