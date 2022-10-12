//
//  VideoCellContentViewStyle.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/12.
//

import Foundation
import UIKit

protocol VideoCellContentViewStyle { }

extension VideoCellContentViewStyle {
    var thumbNailImageViewStyle: (UIImageView) -> () {
        {
            $0.layer.cornerRadius = 24
            $0.layer.shadowColor = UIColor(red: 0.271, green: 0.357, blue: 0.388, alpha: 0.2).cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowOffset = CGSize(width: 0, height: 1)
            $0.layer.shadowRadius = 8
        }
    }
    
    var nameLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.294, green: 0.306, blue: 0.341, alpha: 1)
            $0.font = .notoSans(weight: .kr_Medium, size: 14)
        }
    }
}
