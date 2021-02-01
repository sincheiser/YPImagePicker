//
//  YPLibraryViewCell.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 2015/11/14.
//  Copyright © 2015 Yummypets. All rights reserved.
//

import UIKit
import Stevia

class YPMultipleSelectionIndicator: UIView {
    
    let circle = UIView()
    let label = UILabel()
    var selectionColor = UIColor.ypSystemBlue

    convenience init() {
        self.init(frame: .zero)
        
        let size: CGFloat = 20
        
        sv(
            circle,
            label
        )
        
        circle.fillContainer()
        circle.size(size)
        label.fillContainer()
        
        circle.layer.cornerRadius = size / 2.0
        label.textAlignment = .center
        label.textColor = .white
        label.font = YPConfig.fonts.multipleSelectionIndicatorFont
        
        set(number: nil)
    }
    
    func set(number: Int?) {
        label.isHidden = (number == nil)
        if let number = number {
            circle.backgroundColor = selectionColor
            circle.layer.borderColor = UIColor.clear.cgColor
            circle.layer.borderWidth = 0
            label.text = "\(number)"
        } else {
            circle.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            circle.layer.borderColor = UIColor.white.cgColor
            circle.layer.borderWidth = 1
            label.text = ""
        }
    }
}

class YPLibraryViewCell: UICollectionViewCell {
    
    var representedAssetIdentifier: String!
    let imageView = UIImageView()
    let durationLabel = UILabel()
    let selectionOverlay = UIView()
    let multipleSelectionIndicator = YPMultipleSelectionIndicator()
    let lblUtamaContainer = UIView()
    let lblUtama = UILabel()
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sv(
            imageView,
            durationLabel,
            selectionOverlay,
            multipleSelectionIndicator,
            lblUtamaContainer.sv(
                lblUtama
            )
        )

        imageView.fillContainer()
        selectionOverlay.fillContainer()
        layout(
            durationLabel-5-|,
            5
        )
        
        layout(
            3,
            multipleSelectionIndicator-3-|
        )
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        durationLabel.textColor = .white
        durationLabel.font = YPConfig.fonts.durationFont
        durationLabel.isHidden = true
        selectionOverlay.backgroundColor = .white
        selectionOverlay.alpha = 0
        backgroundColor = .ypSecondarySystemBackground
        
        let c = NSLayoutConstraint(item: multipleSelectionIndicator, attribute: .left, relatedBy: .equal, toItem: lblUtamaContainer, attribute: .right, multiplier: 1, constant: 8)
        c.priority = UILayoutPriority(rawValue: 971) // Make a constraint `required`
        addConstraint(c)
        
        lblUtamaContainer.top(5)
        lblUtamaContainer.Right == multipleSelectionIndicator.Left
        lblUtamaContainer.Top == lblUtama.Top
        lblUtamaContainer.Bottom == lblUtama.Bottom
        lblUtamaContainer.Right == lblUtama.Right
        lblUtamaContainer.Left == lblUtama.Left
        |-lblUtama-|
        
        lblUtamaContainer.backgroundColor = UIColor(red: 208/255, green: 2/255, blue: 26/255, alpha: 1)
        lblUtama.textColor = .white
        lblUtama.text = "Utama"
        lblUtama.font = UIFont(name: "Raleway-SemiBold", size: 9)
        
        lblUtamaContainer.isHidden = true
    }

    override var isSelected: Bool {
        didSet { refreshSelection() }
    }
    
    override var isHighlighted: Bool {
        didSet { refreshSelection() }
    }
    
    private func refreshSelection() {
        let showOverlay = isSelected || isHighlighted
        selectionOverlay.alpha = showOverlay ? 0.6 : 0
    }
    
    func setHidden(number: Int) {
        if number == 1 {
            lblUtamaContainer.isHidden = false
        } else {
            lblUtamaContainer.isHidden = true
        }
    }
}
