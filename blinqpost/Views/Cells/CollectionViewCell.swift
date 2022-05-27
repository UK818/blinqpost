//
//  CollectionViewCell.swift
//  blinqpost
//
//  Created by mac on 27/05/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
	static let identifier = "PostCollectionViewCell"
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
