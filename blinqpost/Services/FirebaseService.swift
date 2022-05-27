//
//  FirebaseService.swift
//  blinqpost
//
//  Created by mac on 26/05/2022.
//

import Foundation
import FirebaseFirestore



class FirebaseService {
	
	private let database = Firestore.firestore()
	var postCollection: [String: Any] = [:]
	
	func fetchPosts() {
		database.collection("post").getDocuments() { [weak self] (querySnapshot, err) in
			if let err = err {
				print("Error getting documents: \(err)")
			} else {
				for document in querySnapshot!.documents {
					let posts = document.data()
					print(posts)
					self?.postCollection = document.data()
//					print("\(document.documentID) => \(document.data().count)")
				}
			}
		}
	}
	
}
