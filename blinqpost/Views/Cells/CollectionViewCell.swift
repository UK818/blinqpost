//
//  CollectionViewCell.swift
//  blinqpost
//
//  Created by mac on 27/05/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
	static let identifier = "PostCollectionViewCell"
	
	private var viewLayout: ViewLayout!
	private var viewModel: ViewModel!
	private var firebaseService: FirebaseService!
	var videoViewModel: VideoViewModel!
	
	weak var displayPictureView: UIImageView!
	weak var usernameLabel: UILabel!
	weak var mediaContentView: UIView!
	weak var mediaContentImageView: UIImageView!
	weak var volumeButton: UIButton!
	weak var descriptionLabel: UILabel!
	weak var timeLabel: UILabel!
	weak var separatorView: UIView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupCell() {
		
		viewLayout = ViewLayout()
		firebaseService = FirebaseManager()
		viewModel = ViewModel(firebaseService: firebaseService)
		videoViewModel = VideoViewModel()
		
		displayPictureView = viewLayout.displayPictureView
		usernameLabel = viewLayout.usernameLabel
		mediaContentView = viewLayout.mediaContentView
		mediaContentImageView = viewLayout.mediaContentImageView
		volumeButton = viewLayout.volumeButton
		descriptionLabel = viewLayout.descriptionLabel
		timeLabel = viewLayout.timeLabel
		separatorView = viewLayout.separatorView
		
		contentView.addSubview(displayPictureView)
		contentView.addSubview(usernameLabel)
		contentView.addSubview(mediaContentView)
		contentView.addSubview(descriptionLabel)
		contentView.addSubview(separatorView)
		contentView.addSubview(timeLabel)
		
		contentView.layer.cornerRadius = 25
		contentView.backgroundColor = UIColor(named: Constants.cellBGColor)
		
		mediaContentView.addSubview(mediaContentImageView)
		mediaContentView.addSubview(volumeButton)
		
		mediaContentImageView.center = mediaContentView.center
		
		volumeButton.addTarget(self, action: #selector(didTapVolumeButton), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			displayPictureView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			displayPictureView.heightAnchor.constraint(equalToConstant: 40),
			displayPictureView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
			displayPictureView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			
			usernameLabel.leadingAnchor.constraint(equalTo: displayPictureView.trailingAnchor, constant: 20),
			usernameLabel.topAnchor.constraint(equalTo: displayPictureView.topAnchor),
			usernameLabel.heightAnchor.constraint(equalToConstant: 40),
			usernameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.86),
			usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
			
			mediaContentView.topAnchor.constraint(equalTo: displayPictureView.bottomAnchor, constant: 20),
			mediaContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			mediaContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
			mediaContentView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
			mediaContentView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.55),
			
			volumeButton.bottomAnchor.constraint(equalTo: mediaContentView.bottomAnchor, constant: 30),
			volumeButton.trailingAnchor.constraint(equalTo: mediaContentView.trailingAnchor, constant: -10),
			volumeButton.widthAnchor.constraint(equalToConstant: 30),
			volumeButton.heightAnchor.constraint(equalToConstant: 30),
			
			mediaContentImageView.widthAnchor.constraint(equalTo: mediaContentView.widthAnchor),
			mediaContentImageView.heightAnchor.constraint(equalTo: mediaContentView.heightAnchor),
			
			descriptionLabel.topAnchor.constraint(equalTo: mediaContentView.bottomAnchor, constant: 10),
			descriptionLabel.leadingAnchor.constraint(equalTo: mediaContentView.leadingAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: mediaContentView.trailingAnchor),
			descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
			descriptionLabel.widthAnchor.constraint(equalTo: mediaContentView.widthAnchor),
			
			separatorView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
			separatorView.widthAnchor.constraint(equalTo: mediaContentView.widthAnchor),
			separatorView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
			separatorView.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
			separatorView.heightAnchor.constraint(equalToConstant: 5),
			
			timeLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10),
			timeLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
			timeLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
			timeLabel.heightAnchor.constraint(equalToConstant: 30),
			timeLabel.widthAnchor.constraint(equalTo: mediaContentView.widthAnchor)
			
		])
	}
	
	func populateCell(with data: Post) {
		usernameLabel?.text = data.username
		descriptionLabel?.text = data.description
		viewModel.convertTimeStampToString(
			timeStamp: Double(data.timestamp ?? 0),
			label: timeLabel
		)
		viewModel.loadImage(
			with: data.displayPicture ?? "",
			in: displayPictureView,
			placeHolder: Constants.displayPicturePlaceholder
		)
		viewModel.loadImage(
			with: data.isVideo == 1 ? data.displayPicture ?? "" : data.media ?? "",
			in: mediaContentImageView,
			placeHolder: Constants.mediaPlaceholder
		)
	 
		if data.isVideo != 0 {
			videoViewModel.loadVideo(with: data.media ?? Constants.videoPlaceholderURL, in: mediaContentView)
			volumeButton.isHidden = false
		} else {
			mediaContentImageView.isHidden = false
			volumeButton.isHidden = true
		}
		
	}
	
	@objc func didTapVolumeButton() {
		if videoViewModel.player?.volume == 0 {
			volumeButton.setImage(UIImage(systemName: Constants.unMuteImage), for: .normal)
			videoViewModel.setVolume(volume: 7)
		} else {
			volumeButton.setImage(UIImage(systemName: Constants.muteImage), for: .normal)
			videoViewModel.setVolume(volume: 0)
		}
	}
	
}
