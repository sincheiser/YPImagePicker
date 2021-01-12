//
//  YPFiltersView.swift
//  photoTaking
//
//  Created by Sacha Durand Saint Omer on 21/10/16.
//  Copyright © 2016 octopepper. All rights reserved.
//

import Stevia

class YPFiltersView: UIView {
    
    let imageView = UIImageView()
    var collectionView: UICollectionView!
    var filtersLoader: UIActivityIndicatorView!
    var btnContainer = UIView()
    var btnRetakeContainer = UIView()
    var imgRetake = UIImageView()
    var btnRetake = UIButton()
    var btnConfirmContainer = UIView()
    var imgConfirm = UIImageView()
    var btnConfirm = UIButton()
    
    fileprivate let collectionViewContainer: UIView = UIView()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout())
        filtersLoader = UIActivityIndicatorView(style: .gray)
        filtersLoader.hidesWhenStopped = true
        filtersLoader.startAnimating()
        filtersLoader.color = YPConfig.colors.tintColor
        
        sv(
            imageView,
            btnContainer.sv(
                btnRetakeContainer.sv(
                    btnRetake,
                    imgRetake
                ),
                btnConfirmContainer.sv(
                    btnConfirm,
                    imgConfirm
                )
            )
        )
        
        let isIphone4 = UIScreen.main.bounds.height == 480
        let sideMargin: CGFloat = isIphone4 ? 20 : 0
        
        |-sideMargin-imageView.top(0)-sideMargin-|
        |-sideMargin-btnContainer-sideMargin-|
        imageView.Bottom == btnContainer.Top
        btnContainer.bottom(0)
        
        |-sideMargin-btnRetakeContainer.left(15).top(15)
        btnConfirmContainer.right(15).top(15)-sideMargin-|
        
        |-sideMargin-btnRetake-sideMargin-|
        |-sideMargin-btnConfirm-sideMargin-|
        
        btnRetake.Bottom == imgRetake.Top
        imgRetake.size(120)
        imgRetake.contentMode = .scaleAspectFit
        imgRetake.image = imageFromBundle("ic_cancel")
        
        btnRetake.size(80)
        btnRetake.setBackgroundColor(.white, forState: .normal)
        btnRetake.setTitleColor(.blue, for: .normal)
        btnRetake.setTitle("Ulangi", for: .normal)

        btnConfirm.Bottom == imgConfirm.Top
        imgConfirm.size(120)
        imgConfirm.contentMode = .scaleAspectFit
        imgConfirm.image = imageFromBundle("ic_confirm")
        imgConfirm.backgroundColor = UIColor.blue
        
        btnConfirm.size(80)
        btnConfirm.setBackgroundColor(.white, forState: .normal)
        btnConfirm.setTitleColor(.blue, for: .normal)
        btnConfirm.setTitle("Gunakan", for: .normal)
        
        imageView.heightEqualsWidth()
        
        backgroundColor = .offWhiteOrBlack
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        layout.itemSize = CGSize(width: 100, height: 120)
        return layout
    }
}
