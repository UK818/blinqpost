//
//  ViewModel.swift
//  blinqpost
//
//  Created by mac on 28/05/2022.
//

import Foundation

protocol ViewModelOutput: AnyObject {
	func updateViews(with data: [Post])
}

class ViewModel {
	
	weak var output: ViewModelOutput?
	private let firebaseService: FirebaseService
	
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
	
//	public func loadImage(with url: String, imageView: UIImageView?) {
//		let imageLink = URL(string: url)
//		let processor = DownsamplingImageProcessor(size: imageView?.bounds.size ?? CGSize(width: 200, height: 188))
//					 |> RoundCornerImageProcessor(cornerRadius: 50)
//		imageView?.kf.indicatorType = .activity
//		imageView?.kf.setImage(
//			with: imageLink,
//			placeholder: UIImage(named: "plaeholder"),
//			options: [
//				.processor(processor),
//				.scaleFactor(UIScreen.main.scale),
//				.transition(.fade(1)),
//				.cacheOriginalImage
//			])
//		{
//			result in
//			switch result {
//			case .success(let value):
//				print("Task done for: \(value.source.url?.absoluteString ?? "")")
//			case .failure(let error):
//				print("Job failed: \(error.localizedDescription)")
//			}
//		}
//	}
	
}
