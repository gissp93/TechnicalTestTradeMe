//
//  ListingCell.swift
//  TechnicalTest
//
//  Created by Gisselle Sanchez on 26/06/22.
//

import UIKit
import SDWebImage

class ListingCell: UITableViewCell {
    
    //MARK: - Variables
    @IBOutlet weak var listingImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var displayPriceLabel: UILabel!
    @IBOutlet weak var reserveLabel: UILabel!
    @IBOutlet weak var buyNowPriceLabel: UILabel!
    @IBOutlet weak var buyNowLabel: UILabel!
    @IBOutlet weak var buyNowStackView: UIStackView!
    
    override func prepareForReuse() {
        buyNowStackView.isHidden = false
        reserveLabel.isHidden = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listingImageView.layer.cornerRadius = 5.0
    }
    
    func setup(item: ListingItem) {
        listingImageView.sd_setImage(with: URL(string: item.picture ?? ""))
        locationLabel.text = item.region ?? ""
        descriptionLabel.text = item.title ?? ""
        
        let isClassified: Bool = item.isClassified ?? false
        
        if isClassified {
            buyNowStackView.isHidden = true
            reserveLabel.isHidden = true
            displayPriceLabel.text = item.priceDisplay ?? ""
        } else {
            
            displayPriceLabel.text = item.priceDisplay ?? ""

            if let reserveStateInt = item.reserveState,
                let reserveState = ReserveState(rawValue: reserveStateInt)  {
                reserveLabel.text = reserveState.title
            } else {
                reserveLabel.isHidden = true
            }
            
            if let buyNowPrice = item.buyNowPrice {
                buyNowPriceLabel.text = "\(buyNowPrice)"
            } else {
                buyNowStackView.isHidden = true
            }
        }
    }
}
