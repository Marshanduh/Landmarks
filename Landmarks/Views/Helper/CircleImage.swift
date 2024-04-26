//
//  CircleImage.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//

import SwiftUI

// Definisikan tampilan CircleImage
struct CircleImage: View {
    var image: Image // Gambar yang akan ditampilkan dalam lingkaran


    var body: some View {
        image
            .clipShape(Circle()) // Memotong gambar menjadi bentuk lingkaran
            .overlay {
                // Menambahkan overlay lingkaran putih dengan ketebalan garis 4
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7) // Menambahkan efek bayangan pada gambar
    }
}

// Pratinjau tampilan CircleImage dengan gambar contoh "turtlerock"
#Preview {
    CircleImage(image: Image("turtlerock"))
}
