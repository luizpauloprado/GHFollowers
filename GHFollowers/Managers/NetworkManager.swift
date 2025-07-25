//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 17/06/25.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://api.github.com/users/"
    let decoder = JSONDecoder()
    let cache = NSCache<NSString, UIImage>()
    let perPage = 25
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint = baseUrl + "\(username)/followers?per_page=\(perPage)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            throw GFError.invalidUsername
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        
        do {
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw GFError.unableToParse
        }
    }
    
    func getUserInfo(for username: String) async throws -> User {
        let endpoint = baseUrl + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            throw GFError.invalidUsername
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GFError.invalidResponse
        }
        
        do {
            return try decoder.decode(User.self, from: data)
        } catch {
            throw GFError.unableToParse
        }
    }
    
    func downloadImage(from urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else {
                return nil
            }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
    
    //    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
    //        let endpoint = baseUrl + "\(username)/followers?per_page=\(perPage)&page=\(page)"
    //
    //        guard let url = URL(string: endpoint) else {
    //            completed(.failure(.invalidUsername))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                decoder.keyDecodingStrategy = .convertFromSnakeCase
    //                let followers = try decoder.decode([Follower].self, from: data)
    //                completed(.success(followers))
    //            } catch {
    //                completed(.failure(.unableToParse))
    //            }
    //        }
    //
    //        task.resume()
    //    }
    
    //    func getUserInfo(for username: String, completed: @escaping (Result<User, GFError>) -> Void) {
    //        let endpoint = baseUrl + "\(username)"
    //
    //        guard let url = URL(string: endpoint) else {
    //            completed(.failure(.invalidUsername))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                decoder.keyDecodingStrategy = .convertFromSnakeCase
    //                decoder.dateDecodingStrategy = .iso8601
    //                let user = try decoder.decode(User.self, from: data)
    //                completed(.success(user))
    //            } catch {
    //                completed(.failure(.unableToParse))
    //            }
    //        }
    //
    //        task.resume()
    //    }
    
    //    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> ()) {
    //        let cacheKey = NSString(string: urlString)
    //
    //        if let image = cache.object(forKey: cacheKey) {
    //            completed(image)
    //            return
    //        }
    //
    //        guard let url = URL(string: urlString) else {
    //            completed(nil)
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
    //            guard let self = self,
    //                  error == nil,
    //                  let response = response as? HTTPURLResponse, response.statusCode == 200,
    //                  let data = data,
    //                  let image = UIImage(data: data) else {
    //                completed(nil)
    //                return
    //            }
    //
    //            self.cache.setObject(image, forKey: cacheKey)
    //            DispatchQueue.main.async { completed(image) }
    //        }
    //
    //        task.resume()
    //    }
}
