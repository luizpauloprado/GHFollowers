//
//  GFError.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 17/06/25.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please, try again."
    case unableToComplete = "Unable to comple your request. Please, check your internet connection."
    case invalidResponse = "Invalid response from the server. Please, try again."
    case invalidData = "The data received from the server was invalid. Please, try again."
    case unableToParse = "Unable to parse the JSON response. Please, try again."
    case unableToFavorite = "There was an error favorting this user. Please, try again."
    case alreadyInFavorites = "This user is already in your favorites."
}
