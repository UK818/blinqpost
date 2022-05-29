//
//  FirebaseService.swift
//  blinqpost
//
//  Created by mac on 26/05/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol FirebaseService {
	func getPosts(completion: @escaping ([Post]) -> Void)
}

class FirebaseManager: FirebaseService {
	
	static let shared = FirebaseManager()
	
	private let database = Firestore.firestore()
	var posts: PostModel = [Post]()
	
	func getPosts(completion: @escaping ([Post]) -> Void) {
		database.collection("post").getDocuments() { [weak self] (querySnapshot, err) in
			if let err = err {
				print("Error getting documents: \(err)")
			} else {
				let documents = querySnapshot!.documents

				for document in documents {
					let post = document
					
					let id = post["id"] as? Int
					let description = post["description"] as? String
					let media = post["link"] as? String
					let displayPicture = post["thumbnail"] as? String
					let username = post["username"] as? String
					let timestamp = post["timestamp"] as? Int
					let isVideo = post["video"] as? Int
					
					let data = Post(id: id, description: description, media: media, isVideo: isVideo, timestamp: timestamp, displayPicture: displayPicture, username: username)
					
					self?.posts.append(data)
					
				}
				
			}
			DispatchQueue.main.async {
				completion(self?.posts ?? [Post]())
			}
			
		}
		
	}
												 
}
