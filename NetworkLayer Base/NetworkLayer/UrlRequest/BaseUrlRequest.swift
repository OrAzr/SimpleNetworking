//
//  BaseUrlRequest.swift
//  NetworkLayer
//
//  Created by orazran on 2/11/19.
//  Copyright © 2019 orazran. All rights reserved.
//

import Foundation



class BaseRequestItem <T:Codable> {
    
    //--------------------------------- MARK: PROPERTIES
    var systemEnv:SystemEnv?
    var apiVersion:APIVer = .v1
    var parmas:[String:String]?
    var path:String = NetworkConstants.Address.path
    var httpMethod:HttpMethod!
    var computedUrl:URL?
    
    var rawRequest:URLRequest?
    
    init(systemEnv:SystemEnv,
         apiVersion:APIVer = .v1,
         params:[String:String]? = nil,
         path:String = NetworkConstants.Address.path,
         method:HttpMethod){
        self.systemEnv = systemEnv
        self.apiVersion = apiVersion
        self.path = path
        self.httpMethod = method
        self.parmas = params

        //  build url
        self.computedUrl = self.buildUrl()
        
        if let computedUrl = self.computedUrl {
            self.rawRequest = URLRequest(url: computedUrl)
            self.rawRequest?.timeoutInterval = 4
        }
    }
}
