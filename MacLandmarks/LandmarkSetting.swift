//
//  LandmarkSetting.swift
//  MacLandmarks
//
//  Created by Marshanda Gwie on 22/04/24.
//

import SwiftUI

// Definisikan tampilan LandmarkSettings
struct LandmarkSettings: View {
    @AppStorage("MapView.zoom")
    // Ambil nilai zoom dari AppStorage untuk pengaturan tampilan peta
    private var zoom: MapView.Zoom = .medium


    var body: some View {
        // Tampilkan formulir untuk mengatur zoom peta
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300) // Atur lebar frame formulir
        .navigationTitle("Landmark Settings") // Atur judul tampilan
        .padding(80) // Atur padding di sekitar formulir
    }
}

// Pratinjau tampilan LandmarkSettings
#Preview {
    LandmarkSettings()
}
