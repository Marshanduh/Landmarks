//
//  MapView.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//

import SwiftUI
import MapKit

// Definisikan tampilan MapView
struct MapView: View {
    var coordinate: CLLocationCoordinate2D // Koordinat untuk menampilkan peta

    // Properti untuk menyimpan data zoom peta menggunakan AppStorage
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    
    // Enum untuk mengatur level zoom peta
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"


        var id: Zoom {
            return self
        }
    }

    // Menghitung delta koordinat berdasarkan level zoom
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }


    var body: some View {
        // Tampilkan peta dengan posisi dan zoom level yang ditentukan
        Map(initialPosition: .region(region))
    }

    // Menghitung region yang akan ditampilkan di peta
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

// Pratinjau tampilan MapView dengan koordinat (contoh)
#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
