//
//  VideoViewController.swift
//  newsfeed
//
//  Created by Rafael Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

class VideoViewController: UIViewController {
	
	@IBOutlet fileprivate weak var tableView: UITableView!
	@IBOutlet fileprivate weak var playerView: UIView!
	@IBOutlet fileprivate weak var healdlineLabel: UILabel!
	@IBOutlet fileprivate weak var playerViewHeightConstraint: NSLayoutConstraint!
	
	fileprivate let playerController = PlayerViewController()
	
//	fileprivate lazy var playerController: PlayerViewController = {
//		let storyboard = UIStoryboard(name: "Video", bundle: Bundle.main)
//		var viewController = storyboard.instantiateViewController(withIdentifier: PlayerViewController.identifier) as! PlayerViewController
//		self.add(asChildViewController: viewController)
//		return viewController
//	}()
	
	var presenter: VideoPresenter?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupLayout()
		self.fillOutlets()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

// MARK: - Table view data source

extension VideoViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		guard let presenter = presenter else {
			fatalError("Presenter cannot be nil")
		}
		return presenter.viewItem.related_content.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let presenter = presenter else {
			fatalError("Presenter cannot be nil")
		}
		
		let cell = tableView.dequeueReusableCell(withIdentifier: VideoItemViewCell.identifier, for: indexPath) as! VideoItemViewCell
		cell.fillOutlets(with: presenter.viewItem.related_content[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		let header = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 30))
		let title = UILabel(frame: CGRect(x: 15, y: 0, width: self.tableView.bounds.width - 15, height: 30))
		title.text = "Vídeos relacionados"
		title.font = UIFont(name: Font.bold.name, size: 14)!
		title.textColor = .white
		header.backgroundColor = .darkGray
		header.addSubview(title)
		
		return header
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 30
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let presenter = presenter else {
			fatalError("Presenter cannot be nil")
		}
		
		let related = presenter.viewItem.related_content[indexPath.row]
		let video = Video(title: related.headline,
		                  resource_url: related.video_url)
		
		self.healdlineLabel.text = related.headline
		self.playerController.changeVideo(video: video)
	}
}

// MARK: - Protocol

extension VideoViewController: VideoViewProtocol {
	
	func showLoading(message: String) {
		SVProgressHUD.setDefaultStyle(.custom)
		SVProgressHUD.setForegroundColor(.white)
		SVProgressHUD.setBackgroundColor(Color.main.value)
		SVProgressHUD.setDefaultMaskType(.clear)
		SVProgressHUD.setFont(UIFont(name: Font.condensedBold.name, size: 15)!)
		SVProgressHUD.show(withStatus: message)
	}
	
	func hideLoading() {
		SVProgressHUD.dismiss()
	}
}

// MARK: - Private methods

extension VideoViewController {
	
	fileprivate func setupLayout() {
		self.title = "NewsFeed"
		self.view.backgroundColor = .black
		self.healdlineLabel.textColor = .white
	}
	
	fileprivate func setPlayerAttributes(with video: Video) {

		let viewWidth = self.view.bounds.width
		let viewHeight = self.view.bounds.width * 0.56
		
		self.playerViewHeightConstraint.constant = CGFloat(viewHeight)
		self.view.layoutIfNeeded()
		
		self.playerController.video = video
		self.playerController.view.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
		self.playerController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		addChildViewController(self.playerController)
		
		self.playerView.addSubview(self.playerController.view)
		self.playerController.didMove(toParentViewController: self)
	}
	
	fileprivate func fillOutlets() {
		
		guard let presenter = presenter else {
			fatalError("Presenter cannot be nil")
		}
		self.healdlineLabel.text = presenter.viewItem.headline
		
		let video = Video(title: presenter.viewItem.headline,
		                  resource_url: presenter.viewItem.video_url)
		
		self.setPlayerAttributes(with: video)
	}
	
	fileprivate func add(asChildViewController viewController: UIViewController) {

		let viewWidth = self.view.bounds.width
		let viewHeight = self.view.bounds.width * 0.56
		
		self.playerViewHeightConstraint.constant = CGFloat(viewHeight)
		self.view.layoutIfNeeded()
		
		addChildViewController(viewController)
		self.playerView.addSubview(viewController.view)

		viewController.view.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
		viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		viewController.didMove(toParentViewController: self)
	}
}
