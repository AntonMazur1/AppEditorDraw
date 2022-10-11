//
//  PhotosViewModel.swift
//  AppEditorDraw
//
//  Created by Клоун on 11.10.2022.
//

import Foundation

protocol PhotosViewModelProtocol {
    var numberOfRows: Int { get }
    init(libraryImages: [Data]?)
    func getImageCellViewModel(at indexPath: IndexPath) -> ImageCollectionViewCellViewModelProtocol?
}

class PhotosViewModel: PhotosViewModelProtocol {
    var libraryImages: [Data]?
    
    var numberOfRows: Int {
        libraryImages?.count ?? 0
    }
    
    required init(libraryImages: [Data]? = nil) {
        self.libraryImages = libraryImages
    }
    
    func getImageCellViewModel(at indexPath: IndexPath) -> ImageCollectionViewCellViewModelProtocol? {
        guard let image = libraryImages?[indexPath.row] else { return nil }
        return ImageCollectionViewCellViewModel(image: image)
    }
}
