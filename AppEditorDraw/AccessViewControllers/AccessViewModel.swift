//
//  ImageViewModel.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import Foundation

protocol AccessViewModelProtocol {
    var libraryImages: [Data]? { get set }
    var numberOfRows: Int { get }
    func getImage(completion: @escaping() -> ())
    func getImageCellViewModel(at indexPath: IndexPath) -> ImageCollectionViewCellViewModelProtocol?
}

class AccessViewModel: AccessViewModelProtocol {
    var libraryImages: [Data]?
    var numberOfRows: Int {
        libraryImages?.count ?? 0
    }
    
    func getImage(completion: @escaping() -> ()) {
        ImageService.getPhotosFromLibrary { [unowned self] assets in
            libraryImages = assets
            completion()
        }
    }
    
    func getImageCellViewModel(at indexPath: IndexPath) -> ImageCollectionViewCellViewModelProtocol? {
        guard let image = libraryImages?[indexPath.row] else { return nil }
        return ImageCollectionViewCellViewModel(image: image)
    }
}
