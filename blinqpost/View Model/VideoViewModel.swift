//
//  VideoViewModel.swift
//  blinqpost
//
//  Created by mac on 29/05/2022.
//

import Foundation
import AVKit
import AVFoundation

class VideoViewModel {
	
	var player: AVPlayer?
	var layer: AVPlayerLayer?
	var isLoop: Bool = false
	
	func loadVideo(with url: String, in view: UIView) {
		player = AVPlayer(url: URL(string: url)!)
		layer = AVPlayerLayer(player: player)
		layer?.videoGravity = .resizeAspectFill
		layer?.frame = view.bounds
		view.layer.addSublayer(layer ?? AVPlayerLayer())
		player?.volume = 0
		play()
	}
	
	func play() {
		if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
			player?.play()
		}
	}
	
	func pause() {
		player?.pause()
	}
	
	func stop() {
		player?.pause()
		player?.seek(to: CMTime.zero)
	}
	
	func setVolume(volume: Int) {
		player?.volume = 0
	}
	
	func reachTheEndOfTheVideo(_ notification: Notification) {
		if isLoop {
			player?.pause()
			player?.seek(to: CMTime.zero)
			player?.play()
		}
	}
	
}
