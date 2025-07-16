//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 16/07/25.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrieved = favorites
                
                switch actionType {
                case .add:
                    guard retrieved.contains(favorite) == false else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    retrieved.append(favorite)
                case .remove:
                    retrieved.removeAll { item in
                        item.login == favorite.login
                    }
                }
                
                completed(saveFavorties(favorites: retrieved))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.data(forKey: keys.favorites) else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let followers = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(followers))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func saveFavorties(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorities = try encoder.encode(favorites)
            defaults.set(encodedFavorities, forKey: keys.favorites)
        } catch {
            return .unableToFavorite
        }
        
        return nil
    }
    
//    static func save<T: Codable>(_ value: T, forKey key: String) {
//        let data = try? JSONEncoder().encode(value)
//        defaults.set(data, forKey: key)
//    }
//
//    static func load<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
//        return nil
//    }
    
}
