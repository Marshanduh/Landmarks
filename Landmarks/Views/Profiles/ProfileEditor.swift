//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan untuk mengedit profil pengguna.
struct ProfileEditor: View {
    // Binding untuk menyimpan profil yang sedang disunting.
    @Binding var profile: Profile
    
    // Rentang tanggal yang diizinkan untuk goalDate.
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            // Pemilihan foto musiman.
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            // Pemilih tanggal untuk goalDate.
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}

// Preview untuk menampilkan ProfileEditor dengan profil default.
#Preview {
    ProfileEditor(profile: .constant(.default))
}
