//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI

// Tampilan untuk menampilkan profil pengguna dengan kemampuan pengeditan
struct ProfileHost: View {
    // Lingkungan untuk mengakses mode pengeditan.
    @Environment(\.editMode) var editMode
    // Lingkungan untuk mengakses data profil pengguna.
    @Environment(ModelData.self) var modelData
    // State untuk menyimpan profil yang sedang disunting.
    @State private var draftProfile = Profile.default


    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                // Tombol "Cancel" saat mode pengeditan aktif.
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // Tombol "Edit" untuk memulai atau keluar dari mode pengeditan.
                EditButton()
            }

            // Tampilan ringkasan profil saat mode pengeditan tidak aktif.
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                // Editor profil saat mode pengeditan aktif.
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

// Preview untuk menampilkan ProfileHost dengan data profil dari ModelData.
#Preview {
    ProfileHost()
        .environment(ModelData())
}
