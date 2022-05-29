//
//  ViewLayout.swift
//  blinqpost
//
//  Created by mac on 27/05/2022.
//

import Foundation
import UIKit

public class ViewLayout {
	
	let displayPictureView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 15
		view.contentMode = .scaleAspectFit
		return view
	}()
	
	let usernameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Username"
		label.textAlignment = .left
		label.textColor = UIColor(named: Constants.textColor)
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		return label
	}()
	
	let mediaContentView: UIView = {
		let container = UIView()
		container.translatesAutoresizingMaskIntoConstraints = false
		container.backgroundColor = UIColor(named: Constants.cellBGColor)
		return container
	}()
	
	let mediaContentImageView: UIImageView = {
		let content = UIImageView()
		content.translatesAutoresizingMaskIntoConstraints = false
		content.contentMode = .scaleAspectFit
		content.backgroundColor = UIColor(named: Constants.cellBGColor)
		return content
	}()
	
	let volumeButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(named: Constants.muteImage), for: .normal)
		return button
	}()
	
	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Description"
		label.textAlignment = .left
		label.numberOfLines = 0
		label.textColor = UIColor(named: Constants.textColor)
		label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
		return label
	}()
	
	let separatorView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor(named: Constants.textColor)
		return view
	}()
	
	let timeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Time"
		label.textAlignment = .left
		label.textColor = UIColor(named: Constants.textColor)
		label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		return label
	}()
	
}
