//
//  PostModel.swift
//  blinqpost
//
//  Created by mac on 26/05/2022.
//

import Foundation

struct Post: Identifiable, Codable {
	var id: Int?
	var description: String?
	var media: String?
	var isVideo, timestamp: Int?
	var displayPicture: String?
	var username: String?
}

typealias PostModel = [Post]
