//
//  ViewController.swift
//  blinqpost
//
//  Created by mac on 26/05/2022.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

	let database = Firestore.firestore()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		database.collection("post").getDocuments() { (querySnapshot, err) in
			if let err = err {
				print("Error getting documents: \(err)")
			} else {
				for document in querySnapshot!.documents {
					print(document.data())
//					print("\(document.documentID) => \(document.data().count)")
				}
			}
		}
	}

}

