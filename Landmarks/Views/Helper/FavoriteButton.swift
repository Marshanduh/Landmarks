//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//

import SwiftUI

// Definisikan tampilan FavoriteButton
struct FavoriteButton: View {
    @Binding var isSet: Bool // Binding untuk menentukan apakah tombol favorit sedang aktif atau tidak


    var body: some View {
        // Tombol untuk membalikkan nilai isSet saat ditekan
        Button {
            isSet.toggle()
        } label: {
            // Label tombol yang menampilkan ikon bintang sesuai dengan status isSet
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)// Style label menjadi iconOnly agar hanya menampilkan ikon
                .foregroundStyle(isSet ? .yellow : .gray)// Warna ikon berubah sesuai dengan status isSet
        }
    }
}

// Pratinjau tampilan FavoriteButton dengan isSet awal true
#Preview {
    FavoriteButton(isSet: .constant(true))
}
