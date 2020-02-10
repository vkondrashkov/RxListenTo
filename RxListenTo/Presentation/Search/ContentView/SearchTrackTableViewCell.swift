//
//  SearchTrackTableViewCell.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class SearchTrackTableViewCell: UITableViewCell, ReuseIdentifiable {
    let durationLabel = UILabel()

    override func prepareForReuse() {
        super.prepareForReuse()

        durationLabel.text = ""
        imageView?.image = nil
        textLabel?.text = ""
        detailTextLabel?.text = ""
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        detailTextLabel?.textColor = Color.americanRiver

        imageView?.layer.cornerRadius = 8.0
        imageView?.layer.masksToBounds = true

        durationLabel.textColor = Color.americanRiver
        durationLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(durationLabel)
        durationLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
