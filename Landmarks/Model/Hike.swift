//
//  Hike.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import Foundation

// Definisikan struktur Hike
struct Hike: Codable, Hashable, Identifiable {
    var id: Int // ID hiking
    var name: String // Nama hiking
    var distance: Double // Jarak hiking
    var difficulty: Int // Tingkat kesulitan
    var observations: [Observation] // Data pengamatan hiking

    // Formatter untuk mengonversi jarak hiking menjadi teks
    static var formatter = LengthFormatter()

    // Komputasi properti untuk mendapatkan teks jarak hiking dalam kilometer
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

    // Definisikan struktur Observation untuk merepresentasikan data pengamatan hiking
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double // Jarak dari awal hiking


        var elevation: Range<Double> // Rentang elevasi
        var pace: Range<Double> // Rentang kecepatan
        var heartRate: Range<Double> // Rentang detak jantung
    }
}
