//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan untuk halaman utama dengan kategori dan fitur-fitur terkait.
struct CategoryHome: View {
    // Lingkungan untuk mengakses data dari ModelData.
    @Environment(ModelData.self) var modelData
    
    // State untuk menampilkan atau menyembunyikan profil pengguna.
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                // Menampilkan halaman fitur dengan kartu fitur.
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())

                // Looping untuk setiap kategori dan menampilkan baris kategori.
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                // Tombol untuk menampilkan profil pengguna.
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            // Menampilkan ProfileHost dalam bentuk sheet saat showingProfile bernilai true.
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            // Tampilan detail saat tidak ada landmark yang dipilih.
            Text("Select a Landmark")
        }
    }
}

// Preview untuk menampilkan CategoryHome dengan data dari ModelData.
#Preview {
    CategoryHome()
        .environment(ModelData())
}

