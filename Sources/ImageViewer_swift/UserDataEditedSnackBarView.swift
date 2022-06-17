//
//  UserDataEditedSnackBarView.swift
//  ImageViewer.swift
//
//  Created by user on 17.06.2022.
//  Copyright © 2022 michaelhenry. All rights reserved.
//

import UIKit

final class UserDataEditedSnackBarView: InitView {
  
  // MARK: - UI elements
  private let contentStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = UIConstants.ContentStackView.spacing
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private let editedImageViewContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let editedImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = UIConstants.EditedImageView.tintColor
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let editedTitleLabelContainerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let editedTitleLabel: LineHeightLabel = {
    let label = LineHeightLabel()
    label.font = UIConstants.EditedTitleLabel.font
    label.textColor = UIConstants.EditedTitleLabel.textColor
    label.lineHeight = UIConstants.EditedTitleLabel.lineHeight
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = UIConstants.EditedTitleLabel.minimumScaleFactor
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  // MARK: - Override methods
  override func initConfigure() {
    super.initConfigure()
    configureSelf()
    configureContentStackView()
    configureEditedImageViewContainerView()
    configureEditedImageView()
    configureEditedTitleLabelContainerView()
    configureEditedTitleLabel()
  }
  
  // MARK: - Public methods
  public func setTitleLabelText(_ text: String) {
    editedTitleLabel.text = text
  }
  
  public func setEditedImageViewImage(_ image: UIImage?) {
    editedImageView.image = image?.withTintColor(
      UIConstants.EditedImageView.tintColor,
      renderingMode: .alwaysTemplate)
  }
  
  public func setEditedImageViewHidden(_ isHidden: Bool) {
    editedImageViewContainerView.isHidden = isHidden
  }
  
  // MARK: - Private methods
  private func configureSelf() {
    backgroundColor = UIConstants.SelfView.backgroundColor
    layer.cornerRadius = UIConstants.SelfView.cornerRadius
  }
  
  private func configureContentStackView() {
    addSubview(contentStackView)
    NSLayoutConstraint.activate(
      [contentStackView.topAnchor.constraint(equalTo: topAnchor),
       contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
       contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIConstants.ContentStackView.horizontal),
       contentStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -UIConstants.ContentStackView.horizontal)])
  }
  
  private func configureEditedImageViewContainerView() {
    contentStackView.addArrangedSubview(editedImageViewContainerView)
  }
  
  private func configureEditedImageView() {
    editedImageViewContainerView.addSubview(editedImageView)
    NSLayoutConstraint.activate(
      [editedImageView.topAnchor.constraint(equalTo: editedImageViewContainerView.topAnchor, constant: UIConstants.EditedImageView.vertical),
       editedImageView.bottomAnchor.constraint(equalTo: editedImageViewContainerView.bottomAnchor, constant: -UIConstants.EditedImageView.vertical),
       editedImageView.leadingAnchor.constraint(equalTo: editedImageViewContainerView.leadingAnchor),
       editedImageView.trailingAnchor.constraint(equalTo: editedImageViewContainerView.trailingAnchor),
       editedImageView.heightAnchor.constraint(equalToConstant: UIConstants.EditedImageView.size),
       editedImageView.widthAnchor.constraint(equalToConstant: UIConstants.EditedImageView.size)])
  }
  
  private func configureEditedTitleLabelContainerView() {
    contentStackView.addArrangedSubview(editedTitleLabelContainerView)
  }
  
  private func configureEditedTitleLabel() {
    editedTitleLabelContainerView.addSubview(editedTitleLabel)
    NSLayoutConstraint.activate(
      [editedTitleLabel.topAnchor.constraint(equalTo: editedTitleLabelContainerView.topAnchor, constant: UIConstants.EditedTitleLabel.top),
       editedTitleLabel.bottomAnchor.constraint(equalTo: editedTitleLabelContainerView.bottomAnchor, constant: -UIConstants.EditedTitleLabel.bottom),
       editedTitleLabel.leadingAnchor.constraint(equalTo: editedTitleLabelContainerView.leadingAnchor),
       editedTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: editedTitleLabelContainerView.trailingAnchor)])
  }
  
  // MARK: - Override
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    if let parent = layer.presentation() {
      let parentFrame = parent.frame
      let position = self.convert(point, to: superview)
      if parentFrame.contains(position) { return self }
    }
    return nil
  }
}

// MARK: - UIConstants
private enum UIConstants {
  enum SelfView {
    static var backgroundColor: UIColor { .black.withAlphaComponent(0.75) }
    static var cornerRadius: CGFloat { 3 }
  }
  enum ContentStackView {
    static var spacing: CGFloat { 15 * Constants.Screen.widthCoefficient }
    static var horizontal: CGFloat { 15 * Constants.Screen.widthCoefficient }
  }
  enum EditedImageView {
    static var size: CGFloat { 24 }
    static var vertical: CGFloat { 7 }
    static var tintColor: UIColor { .white}
  }
  enum EditedTitleLabel {
    static var font: UIFont { UIFont(name: "Geometria", size: 12) ?? .systemFont(ofSize: 12) }
    static var textColor: UIColor { .white }
    static var lineHeight: CGFloat { 16 }
    static var top: CGFloat { 12 }
    static var bottom: CGFloat { 10 }
    static var minimumScaleFactor: CGFloat { 0.8 }
  }
}
