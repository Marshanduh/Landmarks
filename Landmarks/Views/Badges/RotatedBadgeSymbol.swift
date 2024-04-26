//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan simbol badge yang diputar.
struct RotatedBadgeSymbol: View {
    let angle: Angle // Sudut rotasi.
    
    var body: some View {
        //memanggil class BadgeSymbol nya
        BadgeSymbol()
            .padding(-60)
        //function for rotation
            .rotationEffect(angle, anchor: .bottom)// Rotasi simbol badge.
    }
}

//Tampilan rotatedBadgeSymbol
#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
