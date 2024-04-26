//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 18/04/24.
//

import SwiftUI

// Ini adalah entry pointnya aplikasi Landmarks.
@main
struct LandmarksApp: App {
    // Ini digunakan untuk menyimpan data model.
    @State private var modelData = ModelData()

    // Ini adalah bagian yang menentukan bagaimana tampilan aplikasi akan terlihat.
    var body: some Scene {
        // Ini adalah tampilan utama yang menampilkan konten aplikasi.
        WindowGroup {
            ContentView()
                .environment(modelData) // Menyediakan data model ke ContentView.
        }
        
        // Ini adalah bagian yang menambahkan perintah tambahan, tetapi hanya untuk platform selain watchOS.
        #if !os(watchOS)
        .commands {
            LandmarkCommands() // Menambahkan perintah kustom untuk aplikasi.
        }
        #endif

        // Bagian ini adalah untuk menampilkan notifikasi, hanya untuk watchOS.
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        // Ini adalah bagian yang menambahkan pengaturan, tetapi hanya untuk macOS.
        // Khususnya di bagian atas tab biasanya ada menu tambahan untuk settings edit view dll
        #if os(macOS)
        Settings {
            LandmarkSettings() // Menambahkan pengaturan kustom untuk aplikasi.
        }
        #endif
    }
}

