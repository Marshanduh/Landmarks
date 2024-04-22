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
    var isFeatured: Bool

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

    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    //attribute map
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
