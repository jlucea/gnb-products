//
//  ConversionData.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 3/2/23.
//

import Foundation

struct ConversionRate : Decodable {
    let from: String
    let to: String
    let rate: Double
}
