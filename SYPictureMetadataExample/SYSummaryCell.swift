//
//  SYSummaryCell.swift
//  SYPictureMetadataExample
//
//  Created by Stanislas Chevallier on 09/02/2020.
//  Copyright © 2020 Syan.me. All rights reserved.
//

import UIKit

class SYSummaryCell: UITableViewCell {

    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        textLabel?.textColor = .white
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .white
        detailTextLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
