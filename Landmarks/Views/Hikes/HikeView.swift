/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

// Menambahkan extension untuk transisi move and fade
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        //AnyTransition.slide
        //AnyTransition.move(edge: .trailing)
        
        // Menggunakan transisi asimetris untuk masuk dan keluar
        // Pada masuk, menggunakan pergerakan dari tepi sebelah kanan dan memadukan dengan opacity
        // Pada keluar, menggunakan transisi scaling dan memadukan dengan opacity
                
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

// Definisikan tampilan HikeView
struct HikeView: View {
    var hike: Hike // Data hiking
    @State private var showDetail = true // State untuk menunjukkan apakah detail hiking ditampilkan atau tidak

    var body: some View {
        VStack {
            HStack {
                // Tampilkan grafik hiking dengan elevasi sebagai path
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                // Tombol untuk menampilkan atau menyembunyikan detail hiking
                Button {
                    //showDetail.toggle()
//                    withAnimation(.easeInOut(duration: 4)) {
//                        showDetail.toggle()
//                    }
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        //.animation(.spring(), value: showDetail)
                }
            }

            // Tampilkan detail hiking jika showDetail bernilai true
            if showDetail {
                HikeDetail(hike: hike)
                    //.transition(.slide)
                    .transition(.moveAndFade) // Terapkan transisi move and fade saat tampilan detail hiking muncul atau hilang
            }
        }
    }
}

// Pratinjau tampilan HikeView dengan data hiking 
#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
