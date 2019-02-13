//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by orazran on 2/11/19.
//  Copyright © 2019 orazran. All rights reserved.
//

import Foundation


class NetworkManager {
    
    //--------------------------------- MARK: PROPERTIES
    static let shared = NetworkManager()
    var session:URLSession?
    
    
    
    //--------------------------------- MARK: FUNCTIONS
    func setConfigoration(configuration:URLSessionConfiguration? = nil) {
        guard configuration == nil else {
            self.session = URLSession(configuration: configuration!)
            return
        }
        
        //  default configuration goes here
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.timeoutIntervalForRequest = 4
        config.timeoutIntervalForResource = 4
        config.httpAdditionalHeaders = ["":""]
        
        self.session = URLSession(configuration: config)
    }
    
    
    
    
    func perform<T:Codable>(request:BaseRequestItem<T>,
                            completion:@escaping (T)->()) {
        //  set configuration object
        setConfigoration()
        
        
        //  build task and monitor
        let task = session?.dataTask(with: request.rawRequest!, completionHandler: { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            
            do {
                let employee2 = try jsonDecoder.decode(T.self, from: data!)
                completion(employee2)
            } catch {
                print("an error occured")
            }
        })
        
        //  fire network request
        task?.resume()
    }
}
