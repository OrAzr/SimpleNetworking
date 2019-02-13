//
//  NetworkConstants.swift
//  NetworkLayer
//
//  Created by orazran on 2/11/19.
//  Copyright © 2019 orazran. All rights reserved.
//

import Foundation


struct NetworkConstants {
    struct Address {
        static let path:String = ""
    }
}

enum HttpScheme : String {
    case http = "http"
    case https = "https"
}

enum APIVer: String {
    case v1 = "/v1"
    case v2 = "/v2"
    case v3 = "/v3"
    case unversioned = ""
}

enum SystemEnv : String {
    case test   = "your-test-url.com"
    case pre    = "your-pre-url.com"
    case prod   = "your-prod-url.com"
    case mock   = "api.ipify.org"
    
    func scheme() -> String {
        switch self {
        case .test:
            return HttpScheme.http.rawValue

        default:
            return HttpScheme.https.rawValue
        }
    }
}

enum HttpMethod : String{
    case post = "POST", put = "PUT", get = "GET", patch = "PATCH", delete = "DELETE"
}
