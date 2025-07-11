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
    let cache = NSCache<NSString, UIImage>()
    let perPage = 25
    
    private init() { }
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=\(perPage)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
   
            do {
                // let followers = try JSONDecoder().decode([Follower].self, from: data)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                // completed(nil, error.localizedDescription)
                completed(.failure(.unableToParse))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage) -> ()) {
            let cacheKey = NSString(string: urlString)
            
            if let image = cache.object(forKey: cacheKey) {
                completed(image)
                return
            }
            
            guard let url = URL(string: urlString) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else { return }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                guard let data = data else { return }
                
                guard let image = UIImage(data: data) else { return }
                self.cache.setObject(image, forKey: cacheKey)
                
                DispatchQueue.main.async { completed(image) }
            }
            
            task.resume()
        }
}
