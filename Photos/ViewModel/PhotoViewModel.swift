//
//  PhotoViewModel.swift
//  Photos
//
//  Created by 鄭惟臣 on 2020/12/12.
//

import Foundation

class PhotoViewModel {
    let router = Router<PhotoAPI>()
    
    var getPhotosSuccess: (() -> ())?
    var getPhotosFail: ((_ error: String) -> ())?
    
    var photos: [Photo] = [] {
        didSet {
            getPhotosSuccess?()
        }
    }
    
    func getPhotos() {
        router.request(.getPhotos) {[weak self] (data: [Photo]?, error) in
            if let error = error {
                self?.getPhotosFail?(error)
                return
            }
            
            if let data = data {
                self?.photos = data
            }
        }
    }
}
