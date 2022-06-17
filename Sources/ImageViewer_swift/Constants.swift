//
//  Constants.swift
//  ImageViewer.swift
//
//  Created by user on 17.06.2022.
//  Copyright © 2022 michaelhenry. All rights reserved.
//

import UIKit

enum Constants {
  enum Screen {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
    static let heightCoefficient = UIScreen.main.bounds.height / defaultScreenSize.height
    static let widthCoefficient = UIScreen.main.bounds.width / defaultScreenSize.width
    static let isSmall: Bool = heightCoefficient <= 1
    
    private static let defaultScreenSize = CGSize(width: 375, height: 812)
  }
}
