/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing the details for a hike.
*/

import SwiftUI

// Definisikan tampilan HikeDetail
struct HikeDetail: View {
    let hike: Hike // Data hiking
    @State var dataToShow = \Hike.Observation.elevation // KeyPath untuk menampilkan data

    // Tombol-tombol yang akan ditampilkan di bagian bawah tampilan
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]

    var body: some View {
        VStack {
            // Tampilkan grafik hiking dengan data yang ditunjukkan
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)

            // Tampilkan baris tombol untuk mengubah data yang ditampilkan di grafik
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        // Ketika tombol ditekan, ubah data yang ditampilkan
                        dataToShow = value.1
                    } label: {
                        // Label tombol dengan nama data
                        Text(value.0)
                            .font(.system(size: 15))
                        // Sesuaikan warna teks berdasarkan apakah data yang ditunjukkan sedang dipilih
                            .foregroundStyle(value.1 == dataToShow
                                ? .gray
                                : .accentColor)
                            .animation(nil)// Nonaktifkan animasi perubahan warna teks
                    }
                }
            }
        }
    }
}

// Pratinjau tampilan HikeDetail dengan data hiking contoh
#Preview {
    HikeDetail(hike: ModelData().hikes[0])
}
