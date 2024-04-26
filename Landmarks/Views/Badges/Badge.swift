//
//  Badge.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan badge dengan latar belakang dan simbol.
struct Badge: View {
    // Simbol-simbol badge yang diputar.
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5) // Opasitas simbol badge.
    }
    
    var body: some View {
        ZStack {
            // Latar belakang badge.
            BadgeBackground()
            
            GeometryReader { geometry in
                // Menempatkan simbol badge di tengah.
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit() // Menyesuaikan ukuran badge.

    }
}

// Tampilan Badge
#Preview {
    Badge()
}
