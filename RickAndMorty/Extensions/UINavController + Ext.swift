//
//  UINavController + Ext.swift
//  RickAndMorty
//
//  Created by dsm 5e on 18.08.2023.
//

import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

