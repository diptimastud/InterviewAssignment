//
//  CustomCell.swift
//  AssignmentApp
//
//  Created by Dipti Mastud on 4/15/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    // MARK: - Variable declaration and initialization -
    
    private let titleTextLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let imageViewRef : UIImageView = {
        let imgView = UIImageView(image: UIImage())
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    // MARK: - cell initialization -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // Configure Product image
        self.contentView.addSubview(self.imageViewRef)
        self.imageViewRef.translatesAutoresizingMaskIntoConstraints = false
        self.imageViewRef.anchor(top: marginGuide.topAnchor, left: marginGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 50, height: 50, enableInsets: false)
        
        // Configure Product name
        contentView.addSubview(self.titleTextLabel)
        self.titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleTextLabel.numberOfLines = 0
        self.titleTextLabel.anchor(top: marginGuide.topAnchor, left: imageViewRef.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width - 10, height: 0, enableInsets: false)
        
        // Configure Product description
        self.contentView.addSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.textColor = UIColor.lightGray
        self.descriptionLabel.anchor(top: self.titleTextLabel.bottomAnchor, left: imageViewRef.rightAnchor, bottom: marginGuide.bottomAnchor, right: marginGuide.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width - 10, height: 0, enableInsets: false)
    }
    
    // MARK: - Cell value setup -
    
    func setUpCellForCountryDetail(countryDetail: CountryDetail) {
        self.titleTextLabel.text = countryDetail.title
        self.descriptionLabel.text = countryDetail.rowDescription ?? " "

        self.imageViewRef.image = UIImage.init(named: "placeholder")
        if let imageURL = countryDetail.imageHref {
            self.imageViewRef.downloadAndSetImageWithUrl(imageUrl: imageURL)
        }
        
        self.selectionStyle = .none
        self.setNeedsUpdateConstraints()
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
