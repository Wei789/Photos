//
//  PhotoTableViewCell.swift
//  Photos
//
//  Created by 鄭惟臣 on 2020/12/12.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    static let identifier = "PhotoTableViewCell"
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}
