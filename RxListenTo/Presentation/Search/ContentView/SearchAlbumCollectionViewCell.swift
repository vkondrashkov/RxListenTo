//
//  SearchAlbumCollectionViewCell.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class SearchAlbumCollectionViewCell: UICollectionViewCell, ReuseIdentifiable {
    let coverImageView = UIImageView()
    let titleLabel = UILabel()
    let artistNameLabel = UILabel()
    let releaseYearLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .clear
        contentView.backgroundColor = .clear

        coverImageView.contentMode = .scaleToFill
        coverImageView.layer.cornerRadius = 10
        coverImageView.layer.masksToBounds = true
        contentView.addSubview(coverImageView)
        coverImageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.top.leading.trailing.equalToSuperview()
        }

        titleLabel.font = .boldSystemFont(ofSize: 14)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }

        artistNameLabel.font = .systemFont(ofSize: 12)
        artistNameLabel.textColor = Color.americanRiver
        contentView.addSubview(artistNameLabel)
        artistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }

        releaseYearLabel.font = .systemFont(ofSize: 12)
        releaseYearLabel.textColor = Color.americanRiver
        contentView.addSubview(releaseYearLabel)
        releaseYearLabel.snp.makeConstraints { make in
            make.top.equalTo(artistNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
