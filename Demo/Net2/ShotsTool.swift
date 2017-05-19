//
//  ShotsTool.swift
//  DemoDriAPI
//
//  Created by PSL on 5/19/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

fileprivate let accessToken = "37ddfc23b82ae5cfc673bc92770caf17272407d0d07bce3c1840fc993a509667"
fileprivate let accessParameter = "?access_token="

fileprivate let base = "https://api.dribbble.com/v1/"
fileprivate let authUrl = "https://dribbble.com/oauth/authorize"
fileprivate let tokenUrl = "https://dribbble.com/oauth/token"
fileprivate let redirectUrl = "http://www.google.com/"
fileprivate let shotsEndPoint = "https://api.dribbble.com/v1/shots"
fileprivate let userEndPoint = "https://api.dribbble.com/v1/user"
fileprivate let usersEndPoint = "https://api.dribbble.com/v1/users"
fileprivate let followShotEndPoint = "https://api.dribbble.com/v1/user/following/shots"

class ShotsTool {
    static func fetchUser(
        success: @escaping (User?) -> (),
        failure: @escaping (Error?) -> ()) {
        
        let urlStr = userEndPoint.appending(accessParameter + accessToken)
        HTTPTools.get(urlStr: urlStr, success: { (data) in
            let user = User(data: data)
            success(user)
        }) { (error) in
            failure(error)
        }
    }
    
    static func fetchUser(with id: Int,
        success: @escaping (User?) -> (),
        failure: @escaping (Error?) -> ()) {
        
        var urlStr = userEndPoint.appending("/\(id)")
        urlStr.append(accessParameter + accessToken)
        HTTPTools.get(urlStr: urlStr, success: { (data) in
            let user = User(data: data)
            success(user)
        }) { (error) in
            failure(error)
        }
    }
    
    static func fetchShots(
        success: @escaping ([Shot]?) -> (),
        failure: @escaping (Error?) -> ()) {
        
        let urlStr = shotsEndPoint.appending(accessParameter + accessToken)
        print("url: \(urlStr) \n\n")
        
        HTTPTools.get(urlStr: urlStr, success: { (data) in
            
            guard let data = data else {
                assertionFailure("Error: fail to get valid data")
                return
            }
            
            guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [Any] else {
                assertionFailure("Error: fail to serialize")
                return
            }
            if let obj = obj  {
                print(obj)
                print("size of obj: \(obj.count)")
            } else {
                print("Error: fail to get valid obj")
            }
            
            success(nil)
        }) { (error) in
            failure(error)
        }
    }
    
}
