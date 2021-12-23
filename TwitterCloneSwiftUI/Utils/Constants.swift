//
//  Constants.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 21/12/2021.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
