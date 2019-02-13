//
//  ViewController.swift
//  NetworkLayer
//
//  Created by orazran on 2/11/19.
//  Copyright © 2019 orazran. All rights reserved.
//

import UIKit

class GetIpCall : BaseRequestItem <IpCall> {
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let getIp = GetIpCall(systemEnv: .mock, apiVersion: APIVer.unversioned, params: ["format":"json"], path: "", method: .get)

        
        NetworkManager.shared.perform(request: getIp) { (request) in

        }
    }
}

