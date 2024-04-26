//
//  PageView.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan untuk menampilkan serangkaian halaman dengan PageViewController dan PageControl.
struct PageView<Page: View>: View {
    // Daftar halaman yang akan ditampilkan.
    var pages: [Page]
    // State untuk melacak halaman saat ini yang sedang ditampilkan.
    @State private var currentPage = 0

    // Tampilan utama PageView.
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Menampilkan PageViewController untuk mengelola halaman.
            PageViewController(pages: pages, currentPage: $currentPage)
            
            // Menampilkan PageControl untuk menavigasi antara halaman.
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18)) // Menyesuaikan lebar PageControl.
                .padding(.trailing) // Menambahkan padding di sebelah kanan.
        }
        .aspectRatio(3 / 2, contentMode: .fit) // Menyesuaikan aspek rasio tampilan.
    }
}

// Preview untuk menampilkan PageView dengan data dari ModelData.
#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
