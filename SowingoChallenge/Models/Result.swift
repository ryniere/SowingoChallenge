//
//  Result.swift
//  SowingoChallenge
//
//  Created by Ryniere dos Santos Silva on 2020-10-08.
//

import Foundation

struct Result:Codable {
    var hits:[Product]
}

struct Product:Codable {
    
    var name:String
    var description:String
    var isFavorite:Bool
    var vendorInventories:[VendorInventory]
    var images:[ProductImage]

    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case isFavorite = "is_favourite_product"
        case vendorInventories = "vendor_inventory"
        case images
    }
}

struct ProductImage:Codable {
    
    var imageUrl:String?
    var isMainImage:Bool
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image"
        case isMainImage = "main_image_bool"
    }
    
}

struct VendorInventory:Codable {
    
    var price:Double
    var listPrice:Double
    
    enum CodingKeys: String, CodingKey {
        case price
        case listPrice = "list_price"
    }
}

