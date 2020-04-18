//
//  CountryDetails.swift
//  AssignmentApp
//
//  Created by Dipti Mastud on 4/15/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import Foundation

// MARK: - CountryDetails -
struct CountryDetails: Codable {
    let title: String?
    let rows: [CountryDetail]?
}

// MARK: - CountryDetail -
struct CountryDetail: Codable {
    let title, rowDescription: String?
    let imageHref: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
