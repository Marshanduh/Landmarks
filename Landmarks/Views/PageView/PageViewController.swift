//
//  PageViewController.swift
//  Landmarks
//
//  Created by Marshanda Gwie on 21/04/24.
//

import SwiftUI
import UIKit

// Struct untuk menampilkan UIPageViewController di SwiftUI.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    // Binding untuk melacak halaman saat ini yang sedang ditampilkan.
    @Binding var currentPage: Int

    // Membuat coordinator untuk mengelola UIPageViewController.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Membuat instance UIPageViewController dan mengatur dataSource dan delegate-nya.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }

    // Mengupdate UIPageViewController dengan halaman saat ini.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }

    // Coordinator untuk mengelola dataSource dan delegate UIPageViewController.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()

        // Inisialisasi Coordinator dengan menambahkan halaman ke dalam controllers.
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }

        // Mendapatkan viewController sebelum viewController saat ini.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        // Mendapatkan viewController setelah viewController saat ini.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }

        // Menangani ketika animasi perpindahan halaman selesai.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
