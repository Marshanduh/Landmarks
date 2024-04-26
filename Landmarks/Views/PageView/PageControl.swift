//
//  PageControl.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI
import UIKit

// Struct untuk menampilkan UIPageControl di SwiftUI.
struct PageControl: UIViewRepresentable {
    // Jumlah halaman yang akan ditampilkan.
    var numberOfPages: Int
    
    // Binding untuk melacak halaman saat ini yang sedang ditampilkan.
    @Binding var currentPage: Int

    // Membuat coordinator untuk mengelola UIPageControl.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Membuat instance UIPageControl dan mengatur propertinya.
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }

    // Mengupdate properti currentPage dari UIPageControl.
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    // Coordinator untuk mengelola aksi perubahan halaman dari UIPageControl.
    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

