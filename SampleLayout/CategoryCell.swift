//
//  CategoryCell.swift
//  SampleLayout
//
//  Created by radhakrishnan S on 30/06/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
