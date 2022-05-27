//
//  ViewLayout.swift
//  blinqpost
//
//  Created by mac on 27/05/2022.
//

import Foundation
import UIKit
import SwiftUI

public class ViewLayout {
	
	let collectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 320, height: 400)
		layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		layout.scrollDirection = .vertical
		let view = UICollectionView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let displayPictureView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let usernameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let mediaContentImageView: UIImageView = {
		let content = UIImageView()
		content.translatesAutoresizingMaskIntoConstraints = false
		return content
	}()
	
	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let timeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
}
