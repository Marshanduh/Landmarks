//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan kartu fitur yang menampilkan gambar dan teks overlay untuk landmark tertentu.
struct FeatureCard: View {
    var landmark: Landmark

    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark) // Menambahkan teks overlay ke gambar landmark.
            }
    }
}

// Teks overlay untuk menampilkan nama dan lokasi landmark.
struct TextOverlay: View {
    var landmark: Landmark // mengambil data dari Model Landmark

    // Gradient untuk overlay teks.
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        // tata letak untuk tumpukan
        ZStack(alignment: .bottomLeading) {
            gradient
            // Tata letak vertikal
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white) // Warna teks putih.
    }
}

// Preview untuk menampilkan tampilan kartu fitur dengan data landmark dari ModelData.
#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit) // Aspek rasio kartu 3:2.
}


