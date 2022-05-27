//
//  PostModel.swift
//  blinqpost
//
//  Created by mac on 26/05/2022.
//

import Foundation

struct Post: Codable {
	let welcomeDescription: String?
	let link: String?
	let id, video, timestamp: Int?
	let thumbnail: String?
	let username: String?

	enum CodingKeys: String, CodingKey {
		case welcomeDescription = "description"
		case link, id, video, timestamp, thumbnail, username
	}
}
