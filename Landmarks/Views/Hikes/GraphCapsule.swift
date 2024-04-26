/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A single line in the graph.
*/

import SwiftUI

// Mendefinisikan tampilan kustom SwiftUI bernama GraphCapsule
struct GraphCapsule: View, Equatable {
    var index: Int // Indeks dari kapsul
    var color: Color // Warna dari kapsul
    var height: CGFloat // Tinggi dari kapsul
    var range: Range<Double> // Rentang nilai yang direpresentasikan oleh kapsul
    var overallRange: Range<Double> // Rentang nilai keseluruhan dalam grafik

    // Menghitung rasio tinggi dari kapsul berdasarkan rentangnya dan rentang keseluruhan
    var heightRatio: CGFloat {
        // Rasio tinggi adalah rasio dari magnitudo rentang terhadap magnitudo rentang keseluruhan
        // Ini memastikan bahwa tinggi kapsul proporsional terhadap rentang yang direpresentasikan
                
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }

    // Menghitung rasio offset dari kapsul berdasarkan rentangnya dan rentang keseluruhan
    var offsetRatio: CGFloat {
        // Rasio offset adalah rasio dari batas bawah rentang terhadap batas bawah rentang keseluruhan
        // Ini menentukan posisi vertikal kapsul dalam tampilan penampungnya
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    var body: some View {
        // Mendefinisikan tampilan kapsul
        Capsule()
            .fill(color) // Mengisi kapsul dengan warna yang ditentukan
            .frame(height: height * heightRatio) // Mengatur tinggi kapsul berdasarkan rasio tinggi
            .offset(x: 0, y: height * -offsetRatio) // Menggeser kapsul secara vertikal berdasarkan rasio offset
    }
}

// Pratinjau tampilan GraphCapsule dengan data sampel
#Preview {
    GraphCapsule(
        index: 0,
        color: .blue,
        height: 150,
        range: 10..<50,
        overallRange: 0..<100)// Menyediakan data sampel untuk kapsul
}
