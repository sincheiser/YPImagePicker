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
    var lblRetake = UILabel()
    var btnRetake = UIButton()
    var btnConfirmContainer = UIView()
    var imgConfirm = UIImageView()
    var lblConfirm = UILabel()
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
                    imgRetake,
                    lblRetake,
                    btnRetake
                ),
                btnConfirmContainer.sv(
                    imgConfirm,
                    lblConfirm,
                    btnConfirm
                )
            )
        )
        
        let isIphone4 = UIScreen.main.bounds.height == 480
        let sideMargin: CGFloat = isIphone4 ? 20 : 0
        
        |-sideMargin-imageView.top(0)-sideMargin-|
        |-sideMargin-btnContainer-sideMargin-|
        imageView.Bottom == btnContainer.Top
        btnContainer.bottom(0)
        
        let screenWidth = UIScreen.main.bounds.width

        |-sideMargin-btnRetakeContainer.left(screenWidth*(74/375)).centerVertically()
        btnConfirmContainer.right(screenWidth*(74/375)).centerVertically()-sideMargin-|
        btnConfirmContainer.width(100)
        btnRetakeContainer.width(100)
        
        |-sideMargin-imgRetake-sideMargin-|
        |-sideMargin-imgConfirm-sideMargin-|
        |-sideMargin-lblRetake-sideMargin-|
        |-sideMargin-lblConfirm-sideMargin-|
        |-sideMargin-btnRetake-sideMargin-|
        |-sideMargin-btnConfirm-sideMargin-|
        
        
        btnRetake.Top == btnRetakeContainer.Top
        btnRetake.Bottom == btnRetakeContainer.Bottom
        btnConfirm.Top == btnConfirmContainer.Top
        btnConfirm.Bottom == btnConfirmContainer.Bottom
        
        imgRetake.Top == btnRetakeContainer.Top
        imgRetake.Bottom == lblRetake.Top
        imgRetake.width(40).height(40)
        imgRetake.contentMode = .scaleAspectFit
        imgRetake.image = imageFromBundle("ic_cancel")
        
        lblRetake.Bottom == btnRetakeContainer.Bottom
        lblRetake.top(4)
        lblRetake.text = "Ulangi"
        lblRetake.textColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        lblRetake.font = UIFont(name: "Raleway-SemiBold", size: 14)

        imgConfirm.Top == btnConfirmContainer.Top
        imgConfirm.Bottom == lblConfirm.Top
        imgConfirm.width(40).height(40)
        imgConfirm.centerHorizontally()
        imgConfirm.contentMode = .scaleAspectFit
        imgConfirm.image = imageFromBundle("ic_confirm")
        
        lblConfirm.Bottom == btnConfirmContainer.Bottom
        lblConfirm.top(4)
        lblConfirm.text = "Gunakan"
        lblConfirm.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        lblRetake.font = UIFont(name: "Raleway-SemiBold", size: 14)
        
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
