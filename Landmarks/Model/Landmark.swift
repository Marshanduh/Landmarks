//
//  Landmark.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//

//Model file
import Foundation
import SwiftUI
import CoreLocation

//dengan menambahkan identifiable, kt tidak perlu memanggil id nya lagi di kelas viewnya
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool //untuk ketika user ingin menyimpan sebagai favorite
    var isFeatured: Bool // Status apakah landmark merupakan fitur utama

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    //attribute image
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    var featureImage: Image? { // Image landmark fitur jika ada
        isFeatured ? Image(imageName + "_feature") : nil
    }

    //attribute map untuk koordinat landmark pada peta
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D { // Koordinat landmark
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    // Definisikan struktur Coordinates untuk merepresentasikan koordinat landmark
    struct Coordinates: Hashable, Codable {
        var latitude: Double // Latitude
        var longitude: Double // Longitude
    }
}
