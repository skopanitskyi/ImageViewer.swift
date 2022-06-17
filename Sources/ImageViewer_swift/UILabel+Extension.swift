//
//  UILabel+Extension.swift
//  ImageViewer.swift
//
//  Created by user on 17.06.2022.
//  Copyright © 2022 michaelhenry. All rights reserved.
//

import UIKit

public extension UILabel {
  
  func setLineHeight(_ lineHeight: CGFloat) {
    let style = NSMutableParagraphStyle()
    
    style.lineHeightMultiple = lineHeight / self.font.pointSize
    style.lineBreakMode = .byTruncatingTail
    style.alignment = self.textAlignment
    
    if let attributedString = self.attributedText {
      let newAttributedString = NSMutableAttributedString(attributedString: attributedString)
      newAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                       value: style,
                                       range: NSRange(location: 0, length: attributedString.string.count))
      
      self.attributedText = newAttributedString
      
    } else if let text = self.text {
      let attributeString = NSMutableAttributedString(string: text)
      attributeString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                   value: style,
                                   range: NSRange(location: 0, length: text.count))
      
      self.attributedText = attributeString
    }
  }
}
