//
//  ModelData.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//

import Foundation

@Observable
// Definisikan kelas ModelData sebagai model utama dalam aplikasi
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")// Data landmark
    var hikes: [Hike] = load("hikeData.json")// Data hiking
    var profile = Profile.default// Profil pengguna

    // Komputasi properti untuk mendapatkan fitur-fitur landmark
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // Komputasi properti untuk mengelompokkan landmark berdasarkan kategori
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// Fungsi untuk memuat data dari file JSON
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // Cari URL file JSON dalam bundle utama aplikasi
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    // Baca data dari file JSON
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    // Parse data JSON menjadi objek T menggunakan JSONDecoder
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
