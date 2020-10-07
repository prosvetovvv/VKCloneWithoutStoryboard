//
//  VkRequestJson.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 29.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

struct NetworkManager {
    static let shared   = NetworkManager()
    private let baseUrl = "https://api.vk.com/method"
    let token           = Session.shared.token
    let cache           = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFriends(completed: @escaping (Result<[Friend], ErrorMessage>) -> Void) {
        let urlRequest = baseUrl + "/friends.get?fields=photo_100&access_token=\(token)&v=5.124"
        
        guard let url = URL(string: urlRequest) else {
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
                let decoder = JSONDecoder()
                let friendsResponse = try decoder.decode(FriendsResponse.self, from: data)
                let friends = friendsResponse.response.items
                completed(.success(friends))
            } catch {
                print(error)
                completed(.failure(.invalidData))
                return
            }
        }
        
        task.resume()
    }
    
    
    func downloadAvatar(from urlString: String, to avatar: UIImageView) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            avatar.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }

            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async { avatar.image = image }
        }

        task.resume()
    }
    
    
    private func makeUrlComponentsForSearch(with query: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.124")
        ]
        return urlComponents
    }
}
