//
//  LineHeightLabel.swift
//  ImageViewer.swift
//
//  Created by user on 17.06.2022.
//  Copyright © 2022 michaelhenry. All rights reserved.
//

import UIKit

open class LineHeightLabel: UILabel {
  
  // MARK: - Private variables
  
  private var realLineHeight: CGFloat = 18
  
  // MARK: - Public variables
  
  public var lineHeight: CGFloat {
    get { return realLineHeight + UIConstants.lineHeightCorrectOffset }
    set { realLineHeight = newValue - UIConstants.lineHeightCorrectOffset }
  }
  
  override open var text: String? {
    didSet {
      setLineHeight(realLineHeight)
    }
  }
  
  // MARK: - UI constants
  
  private struct UIConstants {
    static let defaultLineHeight: CGFloat = 18
    static let lineHeightCorrectOffset: CGFloat = 3
  }
}
