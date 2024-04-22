//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//

import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark


    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                #endif
            }


            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

////hanya untuk 1 pilihan preview aja
////preview unutk data index 0 (urutan pertama lah)
//#Preview("Turtle Rock"){
//    LandmarkRow(landmark: landmarks[0]) //instance
//}
////data kedua
//#Preview("Salmon") {
//    LandmarkRow(landmark: landmarks[1])
//}

//ini untuk menampilkan beberapa data yg dipilih secara berurutan tanpa harus pilih preview
#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}


