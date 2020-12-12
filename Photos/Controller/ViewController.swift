//
//  ViewController.swift
//  Photos
//
//  Created by 鄭惟臣 on 2020/12/12.
//

import UIKit

class PhotosViewController: UIViewController {

    let photoViewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoViewModel.getPhotos()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}


extension PhotosViewController: UISearchResultsUpdating{
    
}
