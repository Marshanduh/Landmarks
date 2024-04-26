//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by Marshanda Gwie on 22/04/24.
//

import SwiftUI

// Definisikan tampilan LandmarkList
struct LandmarkList: View {
    @Environment(ModelData.self) var modelData // Environment untuk data model
    @State private var showFavoritesOnly = false // State untuk menentukan apakah hanya menampilkan landmark favorit atau tidak

    // Properti komputasi untuk mendapatkan landmark yang telah difilter berdasarkan preferensi menampilkan hanya landmark favorit atau tidak
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }


    var body: some View {
        // Tampilkan tampilan split antara daftar landmark dan detail landmark yang dipilih
        NavigationSplitView {
            // Daftar landmark
            List {
                // Toggle untuk mengubah preferensi menampilkan hanya landmark favorit atau tidak
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                // Loop untuk menampilkan setiap landmark yang telah difilter
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // Animasi default saat daftar landmark diupdate
            .animation(.default, value: filteredLandmarks)
            // Judul navigasi
            .navigationTitle("Landmarks")
        } detail: {
            // Tampilan detail ketika tidak ada landmark yang dipilih
            Text("Select a Landmark")
        }
    }
}

// Pratinjau tampilan LandmarkList dengan menggunakan ModelData environment
#Preview {
    LandmarkList()
        .environment(ModelData())
}
