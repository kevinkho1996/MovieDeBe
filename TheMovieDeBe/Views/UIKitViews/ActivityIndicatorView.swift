//
//  ActivityIndicatorView.swift
//  TheMovieDeBe
//
//  Created by Kevin Kho on 15/10/20.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    func makeUIView(context: Context) -> some UIView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
