//
//  BaseRequestItem+Extension.swift
//  NetworkLayer
//
//  Created by orazran on 2/13/19.
//  Copyright © 2019 orazran. All rights reserved.
//

import Foundation

extension BaseRequestItem {
    func buildUrl() -> URL?{
        var urlComponents = URLComponents()
        urlComponents.scheme = systemEnv?.scheme()
        urlComponents.host = systemEnv?.rawValue
        urlComponents.path = self.path + apiVersion.rawValue
        
        
        guard let params = self.parmas else { return nil }
        
        var queryItems:[URLQueryItem] = []
        for item in params {
            queryItems.append(URLQueryItem(name: item.key, value: item.value))
        }
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}
