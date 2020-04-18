//
//  Services.swift
//  AssignmentApp
//
//  Created by Dipti Mastud on 4/15/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import Foundation

class Services {
    
    static let sharedInstance = Services()
    
    func getCountryDetails(completion: @escaping (CountryDetails?, Error?) -> Void) {
        
        let urlString = "https:dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        guard let serviceURL = URL.init(string: urlString) else { return }
        URLSession.shared.dataTask(with: serviceURL) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                print(err.localizedDescription)
            } else {
                guard let data = data else { return }
                let jsonString = String(decoding: data, as: UTF8.self)
                do {
                    let results = try JSONDecoder().decode(CountryDetails.self, from: jsonString.data(using: .utf8)!)
                    completion(results, nil)
                } catch {
                    print(error.localizedDescription)
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
