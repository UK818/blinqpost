//
//  ViewModel.swift
//  blinqpost
//
//  Created by mac on 28/05/2022.
//

import Foundation
import Kingfisher
import UIKit

protocol ViewModelOutput: AnyObject {
	func updateViews(with data: [Post])
}

class ViewModel {
	
	private let firebaseService: FirebaseService
	weak var output: ViewModelOutput?
	
	init(firebaseService: FirebaseService) {
		self.firebaseService = firebaseService
	}
	
	func fetchPosts() {
		firebaseService.getPosts { [weak self] posts in
			DispatchQueue.main.async {
				self?.output?.updateViews(with: posts)
			}
		}
	}
	
	public func loadImage(with url: String, in imageView: UIImageView?, placeHolder: String) {
		let imageLink = URL(string: url)
		let processor = DownsamplingImageProcessor(size: imageView?.bounds.size ?? CGSize(width: 200, height: 188))
					 |> RoundCornerImageProcessor(cornerRadius: 50)
		imageView?.kf.indicatorType = .activity
		imageView?.kf.setImage(
			with: imageLink,
			placeholder: UIImage(named: placeHolder),
			options: [
				.processor(processor),
				.scaleFactor(UIScreen.main.scale),
				.transition(.fade(1)),
				.cacheOriginalImage
			])
		{
			result in
			switch result {
			case .success(let value):
				print("Task done for: \(value.source.url?.absoluteString ?? "")")
			case .failure(let error):
				print("Job failed: \(error.localizedDescription)")
			}
		}
	}
	
	func convertTimeStampToString(timeStamp: Double, label: UILabel) {
		let date = Date(timeIntervalSince1970: timeStamp)
		let dateFormatter = DateFormatter()
		dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
		dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
		dateFormatter.timeZone = .current
		let localDate = dateFormatter.string(from: date)
		label.text = localDate
	}
	
}
