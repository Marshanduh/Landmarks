//
//  ContentView.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 18/04/24.
//

import SwiftUI

// Tampilan utama aplikasi yang menampilkan tab untuk fitur "Featured" dan "List".
struct ContentView: View {
    @State private var selection: Tab = .featured

    // Enum untuk menentukan tab yang dipilih.
    enum Tab {
        case featured
        case list
    }

    var body: some View {
        // Menggunakan TabView untuk menampilkan konten berdasarkan tab yang dipilih.
        TabView(selection: $selection) {
            // Tampilan CategoryHome untuk tab "Featured".
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star") //untuk Icon tiap tab nya khususnya tab featured
                }
                .tag(Tab.featured)

            // Tampilan LandmarkList untuk tab "List".
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet") //Icon untuk tab list
                }
                .tag(Tab.list)
        }
    }
}

// Menampilkan preview dari ContentView.
#Preview {
    ContentView()
        .environment(ModelData())
}
