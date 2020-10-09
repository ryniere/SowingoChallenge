//
//  ProductTableViewCell.swift
//  SowingoChallenge
//
//  Created by Ryniere dos Santos Silva on 2020-10-08.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var listPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(product: Product) {
        titleLabel.text = product.name
        
        
        if let vendor = product.vendorInventories.first {
            listPriceLabel.attributedText = NSAttributedString(string: "$\(vendor.listPrice)").withStrikeThrough(1)
            priceLabel.text = "$\(vendor.price)"
        }
        
        if let imageUrl = product.images.first?.imageUrl {
            productImageView.downloaded(from: imageUrl)
        }
    }
    
}
