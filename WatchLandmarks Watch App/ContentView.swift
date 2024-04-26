//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI
import UserNotifications

// Definisikan tampilan ContentView
struct ContentView: View {
    // Tampilkan daftar landmark sebagai konten utama
    var body: some View {
        LandmarkList()
        // Eksekusi task saat tampilan dimuat
            .task {
                let center = UNUserNotificationCenter.current()
                // Minta izin pengguna untuk notifikasi dengan opsi alert, sound, dan badge
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}


// Pratinjau tampilan ContentView dengan menggunakan ModelData environment
#Preview {
    ContentView()
        .environment(ModelData())
}
