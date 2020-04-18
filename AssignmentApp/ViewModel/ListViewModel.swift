//
//  ListViewModel.swift
//  AssignmentApp
//
//  Created by Dipti Mastud on 17/04/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {
    func getCountryDetails(completion: @escaping (CountryDetails?, Error?) -> Void) {
        Services.sharedInstance.getCountryDetails { (countyDetails, error) in
            DispatchQueue.main.async {
                if error != nil {
                    completion(nil, error)
                } else {
                    if countyDetails != nil {
                        completion(countyDetails, nil)
                    }
                }
            }
        }
    }
}
