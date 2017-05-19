//
//  HTTPTools.swift
//  DemoDriAPI
//
//  Created by PSL on 5/19/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import Alamofire

class HTTPTools {
    static func get(
        urlStr: String,
        success: @escaping (Data?) -> (),
        failure: @escaping (Error?) -> ()) {
        
        let mgr = SessionManager.shared.mgr
        let url = URL(string: urlStr)!
        mgr.request(url, method: .get)
        .responseData { (response) in
            if let error = response.result.error {
                failure(error)
            } else {
                success(response.result.value)
            }
        }
        
        
    }
    
    static func post(
        urlStr: String,
        parameters: [String: Any]? = nil,
        success: @escaping (Data?) -> (),
        failure: @escaping (Error?) -> ()) {
        
        let mgr = SessionManager.shared.mgr
        let url = URL(string: urlStr)!
        mgr.request(url, method: .post, parameters: parameters)
        .responseData { (response) in
            if response.result.isSuccess {
                success(response.result.value)
            } else {
                failure(response.result.error)
            }
        }
    }
    
    static func delete(
        urlStr: String,
        parameters: [String: Any]? = nil,
        success: @escaping (Data?) -> (),
        failure: @escaping (Error?) -> ()) {
        
        let mgr = SessionManager.shared.mgr
        let url = URL(string: urlStr)!
        mgr.request(url, method: .delete, parameters: parameters)
        .responseData { (response) in
            if response.result.isSuccess {
                success(response.result.value)
            } else {
                failure(response.result.error)
            }
        }
    }
}
