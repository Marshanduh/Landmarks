//
//  Profile.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import Foundation

// Definisikan struktur Profile untuk menyimpan profil pengguna
struct Profile {
    var username: String // Nama pengguna
    var prefersNotifications = true // Preferensi notifikasi pengguna (default true)
    var seasonalPhoto = Season.winter // Foto musiman pengguna (default winter)
    var goalDate = Date() // Tanggal target pengguna (default saat ini)

    // Profil pengguna default dengan username "g_kumar"
    static let `default` = Profile(username: "g_kumar")

    // Enum untuk merepresentasikan musim dengan emoji dan menyediakan ID Identifiable
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"


        var id: String { rawValue } // ID Identifiable adalah nilai raw dari kasus enum
    }
}
