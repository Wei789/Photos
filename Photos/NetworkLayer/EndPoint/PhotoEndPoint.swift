//
//  StoreEndPoint.swift
//  PureSwiftNetwork
//
//  Created by Weichen Cheng_鄭惟臣 on 2018/6/19.
//  Copyright © 2018年 Weichen Cheng_鄭惟臣. All rights reserved.
//

import Foundation


public enum PhotoAPI {
    case getPhotos
}

extension PhotoAPI: EndPointType {
    var baseURL: URL? {
        return nil
    }
    
    var path: String {
        switch self {
        case .getPhotos:
            return "photos"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .getPhotos:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
