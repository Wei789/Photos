//
//  ViewController.swift
//  Photos
//
//  Created by 鄭惟臣 on 2020/12/12.
//

import UIKit
import SDWebImage

class PhotosViewController: UIViewController {
    @IBOutlet weak var photoTableView: UITableView!
    var activityIndicator: UIActivityIndicatorView!
    let photoViewModel = PhotoViewModel()
    var searchString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .blue
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        photoViewModel.getPhotos()
        photoViewModel.getPhotosSuccess = {[weak self] in
            DispatchQueue.main.async {
                self?.photoTableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = ""
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}


extension PhotosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if navigationItem.searchController!.isActive && searchString.count != 0 {
            return photoViewModel.searchPhotos.count
        } else {
            return photoViewModel.photos.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier) as? PhotoTableViewCell else {
            fatalError("Could not dequeue tableCell")
        }
        
        var photos: [Photo] = []
        if navigationItem.searchController!.isActive && searchString.count != 0 {
            photos = photoViewModel.searchPhotos
        } else {
            photos = photoViewModel.photos
        }
        
        cell.titleLabel.text = photos[indexPath.row].title
        cell.photoImageView.sd_setImage(with: photos[indexPath.row].thumbnailUrl)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if navigationItem.searchController!.isActive && searchString.count != 0 {
            print(photoViewModel.searchPhotos[indexPath.row])
        } else {
            print(photoViewModel.photos[indexPath.row])
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension PhotosViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchString = searchController.searchBar.text!
        photoViewModel.searchPhotos = photoViewModel.photos.filter({$0.title.localizedCaseInsensitiveContains(searchString)})
        photoTableView.reloadData()
    }
}
