//
//  InitView.swift
//  ImageViewer.swift
//
//  Created by user on 17.06.2022.
//  Copyright © 2022 michaelhenry. All rights reserved.
//

import UIKit

open class InitView: UIView {
  
  // MARK: - Life cycle
  public init() {
    super.init(frame: .zero)
    initConfigure()
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    initConfigure()
  }
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initConfigure()
  }
  
  // MARK: - Init configure
  open func initConfigure() {
    
  }
}
