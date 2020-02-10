//
//  SearchArtistCollectionViewCell.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class SearchArtistCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    let coverImageView = UIImageView()
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .clear
        contentView.backgroundColor = .clear

        coverImageView.contentMode = .scaleToFill
        coverImageView.layer.cornerRadius = 50
        coverImageView.layer.masksToBounds = true
        contentView.addSubview(coverImageView)
        coverImageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.top.leading.trailing.equalToSuperview()
        }

        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 14)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
