//
//  VkRequestJson.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 29.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

struct VKManager {
    
    let session = Session.instance
    
    func fetchFriends() {
        let url = "https://api.vk.com/method/friends.get?fields=bdate&access_token=\(session.token)&v=5.124"
        performRequest(with: url)
    }
    
    func fetchPhotos(with path: String) {
        let url = "https://api.vk.com/method/photos.getAll?&access_token=\(session.token)&v=5.124"
        
        performRequest(with: url)
    }
    
    func fetchGroups() {
        let url = "https://api.vk.com/method/groups.get?extended=1&access_token=\(session.token)&v=5.124"
        
        performRequest(with: url)
    }
    
    func fetchSearchedGroups(with query: String) {
        let urlComponents = makeUrlComponentsForSearch(with: query)
        
        performRequest(with: urlComponents.url!.absoluteString)
    }
    
    private func performRequest(with url: String) {
        if let url = URL(string: url) {
            debugPrint(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                let friends = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                debugPrint(friends!)
            }
            task.resume()
        }
    }
    
    private func makeUrlComponentsForSearch(with query: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "access_token", value: session.token),
            URLQueryItem(name: "v", value: "5.124")
        ]
        return urlComponents
    }
}
