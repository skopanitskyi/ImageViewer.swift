//
//  SnackBarPresentedView.swift
//  Tada
//
//  Created by Сергей Копаницкий on 24.05.2022.
//

import UIKit

class SnackBarPresentedView: InitView {
  
  // MARK: - Public methods
  public var snackBarBottomOffset: CGFloat {
    return UIConstants.SnackBarView.bottom
  }
  
  public var snackBarBackgroundColor = UIConstants.SnackBarView.backgroundColor {
    didSet {
      snackBarView.backgroundColor = snackBarBackgroundColor
    }
  }
  
  public func bringToFront() {
    bringSubviewToFront(snackBarView)
  }
  
  // MARK: - Private variables
  private var isPresentingSnackBar = false
  private var topConstraint: NSLayoutConstraint?
    
  // MARK: - UI elements
  private let snackBarView: UserDataEditedSnackBarView = {
    let view = UserDataEditedSnackBarView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Override methods
  override func initConfigure() {
    super.initConfigure()
    configureSnackBarView()
  }
  
  // MARK: - Public methods
  public func showSnackBarView() {
    guard !isPresentingSnackBar else { return }
    isPresentingSnackBar = true
    let offset = snackBarView.frame.height + snackBarBottomOffset
    UIView.animate(withDuration: UIConstants.Animation.duration,
                   delay: .zero,
                   options: AnimationOptions.allowUserInteraction,
                   animations: { [weak self] in
      guard let self = self else { return }
      self.topConstraint?.constant = -offset
      self.layoutIfNeeded()
    }, completion: { _ in
      UIView.animate(
        withDuration: UIConstants.Animation.duration,
        delay: UIConstants.Animation.delay) { [weak self] in
          guard let self = self else { return }
          self.topConstraint?.constant = .zero
          self.layoutIfNeeded()
        } completion: { [weak self] _ in
          self?.isPresentingSnackBar = false
        }
    })
  }
  
  public func setSnackBarTitle(_ title: String) {
    snackBarView.setTitleLabelText(title)
  }
  
  public func setSnackBarImage(_ image: UIImage?) {
    snackBarView.setEditedImageViewImage(image)
  }
  
  public func setSnackBarImageHidden(_ isHidden: Bool) {
    snackBarView.setEditedImageViewHidden(isHidden)
  }
  
  public func getSnackBarView() -> UIView {
    return snackBarView
  }
  
  // MARK: - Private methods
  private func configureSnackBarView() {
    addSubview(snackBarView)
    topConstraint = snackBarView.topAnchor.constraint(equalTo: bottomAnchor)
    topConstraint?.isActive = true
    NSLayoutConstraint.activate([snackBarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.SnackBarView.horizontal),
                                 snackBarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIConstants.SnackBarView.horizontal)])
  }
}

// MARK: - UIConstants
private enum UIConstants {
  enum Animation {
    static var duration: CGFloat { 0.3 }
    static var delay: CGFloat { 2 }
  }
  enum SnackBarView {
    static var backgroundColor: UIColor { UIColor.black.withAlphaComponent(0.75) }
    static var horizontal: CGFloat { 16 }
    static var bottom: CGFloat { 50 }
  }
}
