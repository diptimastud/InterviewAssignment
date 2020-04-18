//
//  UIImageView+Extension.swift
//  AssignmentApp
//
//  Created by Dipti Mastud on 17/04/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import UIKit

// MARK: - UIImageView extension -

extension UIImageView {
    
    /// Download the image from server url and sets it to current imageview.
    /// - Parameter imageUrl: Image url coming from server.
    func downloadAndSetImageWithUrl(imageUrl: String) {
        URLSession.shared.dataTask(with: NSURL(string: imageUrl)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                guard let imageData = data else { return }
                if let image: UIImage = UIImage.init(data: imageData) {
                    self.image = image
                }
            })
        }).resume()
    }
}
