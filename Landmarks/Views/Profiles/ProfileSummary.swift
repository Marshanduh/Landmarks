//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan untuk menampilkan ringkasan profil pengguna.
struct ProfileSummary: View {
    // Lingkungan untuk mengakses data dari ModelData.
    @Environment(ModelData.self) var modelData
    
    // Data profil pengguna yang akan ditampilkan.
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)

                Divider()

                // Daftar lencana hiking yang telah diselesaikan.
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)

                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }

                Divider()

                // Daftar hiking terbaru yang telah dilakukan.
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)

                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

// Preview untuk menampilkan ProfileSummary dengan data profil default.
#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}

