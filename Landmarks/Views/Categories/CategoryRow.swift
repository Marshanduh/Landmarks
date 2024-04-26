//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan untuk baris kategori dengan daftar landmark terkait.
struct CategoryRow: View {
    // Nama kategori.
    var categoryName: String
    
    // Daftar landmark dalam kategori.
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            // Judul kategori.
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            // ScrollView untuk daftar landmark dalam kategori.
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        // Navigasi ke halaman detail untuk setiap landmark.
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

// Preview untuk menampilkan CategoryRow dengan data landmark terkait.
#Preview {
    // Mengambil data landmark dari ModelData.
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}

