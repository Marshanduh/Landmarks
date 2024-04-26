//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Definisikan tampilan NotificationView
struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?


    var body: some View {
        VStack {
            // Tampilkan gambar landmark jika tersedia
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }

            // Tampilkan judul notifikasi atau "Unknown Landmark" jika tidak tersedia
            Text(title ?? "Unknown Landmark")
                .font(.headline)


            Divider()

            // Tampilkan pesan notifikasi atau pesan default jika tidak tersedia
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

// Pratinjau tampilan NotificationView tanpa parameter
#Preview {
    NotificationView()
}

// Pratinjau tampilan NotificationView dengan parameter
#Preview {
    NotificationView(
        title: "Turtle Rock",
        message: "You are within 5 miles of Turtle Rock.",
        landmark: ModelData().landmarks[0])
}
