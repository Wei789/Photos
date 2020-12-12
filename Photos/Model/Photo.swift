//
//  Photo.swift
//  Photos
//
//  Created by 鄭惟臣 on 2020/12/12.
//

import Foundation

struct Photo: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var urlString: String
    var thumbnailUrlString: String
    var url: URL? {
        return URL(string: urlString)
    }
    
    var thumbnailUrl: URL? {
        return URL(string: thumbnailUrlString)
    }
    
    private enum CodingKeys : String, CodingKey {
        case albumId = "albumId",
             id = "id",
             title = "title",
             urlString = "url",
             thumbnailUrlString = "thumbnailUrl"
    }
}
