//
//  ListingModel.swift
//  TechnicalTest
//
//  Created by Gisselle Sanchez on 26/06/22.
//

import Foundation

struct ListingsData: Decodable {
    let listings: [ListingItem]?
    
    enum CodingKeys: String, CodingKey {
        case listings = "List"
    }
}

struct ListingItem: Decodable {
    var id: Int
    var picture: String?
    var title: String?
    var region: String?
    var reserveState: Int?
    var priceDisplay: String?
    var buyNowPrice: Double?
    var isClassified: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "ListingId"
        case picture = "PictureHref"
        case title = "Title"
        case region = "Region"
        case reserveState = "ReserveState"
        case priceDisplay = "PriceDisplay"
        case buyNowPrice = "BuyNowPrice"
        case isClassified = "IsClassified"
    }
}

enum ReserveState: Int {
    case none = 0
    case met = 1
    case notMet = 2
    case notApplicable = 3
    
    var title: String {
        switch self {
        case .none:
            return "No reserve"
        case .met:
            return "Reserve met"
        case .notMet:
            return "Reserve not met"
        case .notApplicable:
            return "Not Applicable"
        }
    }
}
