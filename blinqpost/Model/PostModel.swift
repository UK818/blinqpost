//
//  PostModel.swift
//  blinqpost
//
//  Created by mac on 26/05/2022.
//

import Foundation

//class Posts: Object {
//	@Persisted var id: Int
//	@Persisted var username: String = ""
//	@Persisted var descriptionText: String = ""
//	@Persisted var displayPicture:  String = ""
//	@Persisted var media: String = ""
//	@Persisted var isVideo: Int
//	@Persisted var timestamp: Int
//	
//	convenience init(username: String, descriptionText: String, displayPicture: String, media: String) {
//		self.init()
//		self.username = username
//		self.descriptionText = descriptionText
//		self.displayPicture = displayPicture
//		self.media = media
//	}
//}

struct Post: Identifiable, Codable {
	var id: Int?
	var description: String?
	var media: String?
	var isVideo, timestamp: Int?
	var displayPicture: String?
	var username: String?
}

typealias PostModel = [Post]
