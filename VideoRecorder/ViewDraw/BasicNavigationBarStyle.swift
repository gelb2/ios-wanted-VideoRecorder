//
//  BasicNavigationBarStyle.swift
//  VideoRecorder
//
//  Created by sokol on 2022/10/11.
//

import Foundation
import UIKit

protocol BasicNavigationBarStyling { }

extension BasicNavigationBarStyling {
    var navigationBarStyle: (UINavigationBar) -> () {
        {
            $0.shadowImage = UIImage() //default: nil
            $0.isTranslucent = true
            $0.titleTextAttributes = [.foregroundColor : UIColor.black]
        }
    }
}
