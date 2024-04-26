//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan untuk item dalam kategori, menampilkan gambar landmark dan namanya.
struct CategoryItem: View {
    // Data landmark yang akan ditampilkan.
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            // Menampilkan gambar landmark dengan properti tertentu.
            landmark.image
                .renderingMode(.original) // Menampilkan gambar dalam mode asli.
                .resizable() // Mengizinkan gambar untuk diubah ukurannya.
                .frame(width: 155, height: 155) // Menyesuaikan ukuran gambar.
                .cornerRadius(5) // Memberi sudut bulat pada gambar.
            
            // Menampilkan nama landmark dengan properti tertentu.
            Text(landmark.name)
                .foregroundStyle(.primary) // Warna teks menggunakan warna primer.
                .font(.caption) // Ukuran font caption.
        }
        .padding(.leading, 15) // Padding di sebelah kiri.
    }
}

// Preview untuk menampilkan CategoryItem dengan data landmark dari ModelData.
#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}



