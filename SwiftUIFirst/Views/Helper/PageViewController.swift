//
//  FeatureCard.swift
//  SwiftUIFirst
//
//  Created by Руслан on 25.12.2023.
//

import SwiftUI
import UIKit


struct PageViewController<Page: View>: UIViewControllerRepresentable {

    var pages: [Page]

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)


        return pageViewController
    }


    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject {
        var parent:PageViewController
        
        init(parent: PageViewController) {
            self.parent = parent
        }
    }
}