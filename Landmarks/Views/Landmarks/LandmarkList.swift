//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 19/04/24.
//


import SwiftUI

////ini hanya berupa static saja
//struct LandmarkList: View {
//    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//    }
//}

//kalo dynamic code nya seperti ini
struct LandmarkList: View {
    // Lingkungan untuk mengakses data dari ModelData.
    @Environment(ModelData.self) var modelData
    
    // State untuk menampilkan hanya favorit atau semua landmark.
    @State private var showFavoritesOnly = false
    
    // State untuk filter kategori landmark.
    @State private var filter = FilterCategory.all
    
    // State untuk menyimpan landmark yang dipilih.
    @State private var selectedLandmark: Landmark?

    // Enum untuk kategori filter.
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }

    // Fungsi untuk mengambil landmark yang sudah difilter.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }

    // Judul halaman sesuai dengan filter dan status favorit.
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    // Index landmark yang dipilih.
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationSplitView {
            List(selection: $selectedLandmark) {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink { //untuk mengarahkan ke page landmarkdetail jika ditekan salah satu listnya
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
                
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}

