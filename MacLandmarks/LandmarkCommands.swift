//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 22/04/24.
//

import SwiftUI

//Ini digunakan untuk menampilkan menu perintah yang berkaitan dengan tindakan pada landmark yang dipilih.
struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

//Ekstensi FocusedValues menambahkan properti komputasi selectedLandmark untuk menyediakan akses ke nilai landmark yang dipilih.
extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
