//
//  BottomSheetDelegate.swift
//
//
//  Created by Serhii Kharauzov on 03.09.2024.
//

import Foundation

public protocol BottomSheetDelegate: AnyObject {
    /// Called after BottomSheet being dismissed
    func didDismissBottomSheetView()
}
