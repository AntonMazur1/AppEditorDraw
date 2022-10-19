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
    func getImageForEdit(at indexPath: IndexPath) -> DrawingViewModelProtocol?
}

class PhotosViewModel: PhotosViewModelProtocol {
    var libraryImages: [Data]?
    
    var numberOfRows: Int {
        libraryImages?.count ?? 0
    }
    
    required init(libraryImages: [Data]?) {
        self.libraryImages = libraryImages
    }
    
    func getImageCellViewModel(at indexPath: IndexPath) -> ImageCollectionViewCellViewModelProtocol? {
        guard let image = libraryImages?[indexPath.row] else { return nil }
        return ImageCollectionViewCellViewModel(libraryImage: image)
    }
    
    func getImageForEdit(at indexPath: IndexPath) -> DrawingViewModelProtocol? {
        DrawingViewModel(libraryImage: libraryImages ?? [], imageIndex: indexPath.row)
    }
}
