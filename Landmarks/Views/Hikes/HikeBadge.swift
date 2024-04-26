//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Definisikan tampilan HikeBadge
struct HikeBadge: View {
    var name: String// Nama untuk ditampilkan di badge


    var body: some View {
        VStack(alignment: .center) {
            // Tampilkan badge dengan ukuran tertentu
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0) // Mengubah skala badge menjadi sepertiga ukuran aslinya
                .frame(width: 100, height: 100) // Frame baru untuk menyesuaikan ukuran badge yang telah diubah skala
            // Tampilkan teks dengan nama badge
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")// Label aksesibilitas untuk teks nama badge
        }
    }
}

// Pratinjau tampilan HikeBadge 
#Preview {
    HikeBadge(name: "Preview Testing")
}
