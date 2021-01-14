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
        
        sv(
            imageView,
            btnContainer.sv(
                btnRetakeContainer.sv(
                    imgRetake,
                    btnRetake
                ),
                btnConfirmContainer.sv(
                    imgConfirm,
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
        |-sideMargin-btnRetake-sideMargin-|
        |-sideMargin-btnConfirm-sideMargin-|
        
        imgRetake.Top == btnRetakeContainer.Top
        imgRetake.Bottom == btnRetake.Top
        imgRetake.width(40).height(40)
        imgRetake.contentMode = .scaleAspectFit
        imgRetake.image = imageFromBundle("ic_cancel")
        
        btnRetake.Bottom == btnRetakeContainer.Bottom
        btnRetake.setTitleColor(UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1), for: .normal)
        btnRetake.setTitle("Ulangi", for: .normal)
        btnRetake.titleLabel?.font = UIFont(name: "Helvetica", size: 14)

        imgConfirm.Top == btnConfirmContainer.Top
        imgConfirm.Bottom == btnConfirm.Top
        imgConfirm.width(40).height(40)
        imgConfirm.centerHorizontally()
        imgConfirm.contentMode = .scaleAspectFit
        imgConfirm.image = imageFromBundle("ic_confirm")
        
        btnConfirm.Bottom == btnConfirmContainer.Bottom
        btnConfirm.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btnConfirm.setTitle("Gunakan", for: .normal)
        btnConfirm.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        
        imageView.heightEqualsWidth()
        
        backgroundColor = .offWhiteOrBlack
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
    
    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        layout.itemSize = CGSize(width: 100, height: 120)
        return layout
    }
    
    func back() {
        
    }
}
