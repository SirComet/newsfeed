//
//  PlayerViewController.swift
//  newsfeed
//
//  Created by Rafael Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewController: AVPlayerViewController {

	fileprivate enum State {
		case playing
		case paused
	}
	
	fileprivate var state = State.paused
	var video: Video?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.action()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.action()
	}
	
	deinit {
		self.player = nil
	}
}

// MARK: - Public methods

extension PlayerViewController {
	
	func changeVideo(video: Video) {
		self.video = video
		self.action()
	}
}

// MARK: - Private methods

extension PlayerViewController {
	
	fileprivate func action() {
		
		guard let video = self.video else {
			print("video cannot be nil")
			return
		}
		
		switch state {
		case .playing:
			self.state = .paused
			self.pause()
		case .paused:
			self.state = .playing
			self.play(url: video.resource_url)
		}
	}
	
	private func play(url: String) {

		self.player = AVPlayer(url: URL(string: url)!)
		
		guard let player = self.player else {
			print("Invalid URL to player video")
			return
		}
		player.play()
	}

	private func pause() {

		guard let player = self.player else {
			return
		}
		player.pause()
	}
}
