//
//  ViewController.swift
//  blinqpost
//
//  Created by mac on 26/05/2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, ViewModelOutput {

	private var viewModel: ViewModel!
	private var viewLayout: ViewLayout!
	private var collectionView: UICollectionView!
	private let cache = KingfisherManager.shared.cache
	
	var posts: PostModel!
	
	init(viewModel: ViewModel, viewLayout: ViewLayout) {
		self.viewModel = viewModel
		self.viewLayout = viewLayout
		super.init(nibName: nil, bundle: nil)
		self.viewModel.output = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.fetchPosts()
		viewLayoutSetup()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		cache.clearMemoryCache()
		cache.clearDiskCache()
		cache.cleanExpiredDiskCache()
	}
	
	func viewLayoutSetup() {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: view.frame.width - 40, height: view.frame.height/2)
		layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		layout.scrollDirection = .vertical
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(
			CollectionViewCell.self,
			forCellWithReuseIdentifier: CollectionViewCell.identifier
		)
		
		view.addSubview(collectionView)
		collectionViewSetup()
	}
	
	func updateViews(with data: [Post]) {
		self.posts = data
		self.collectionView.reloadData()
	}
	
	func collectionViewSetup() {
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.frame = view.bounds
		collectionView.center = view.center
		collectionView.backgroundColor = UIColor(named: Constants.backgroundColor)
	}

}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return posts?.count ?? 2
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.populateCell(with: posts?[indexPath.row] ?? Post())
		return cell
	}
		
}

extension ViewController: UICollectionViewDelegate {
	
	private func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: CollectionViewCell, forItemAt indexPath: IndexPath) {
		let post = posts[indexPath.row]
		if let player = cell.videoViewModel.player, post.isVideo == 1 {
			if player.rate == 0 {
				player.pause()
				cell.videoViewModel.setVolume(volume: 0)
			}
		}
	}
	
}
