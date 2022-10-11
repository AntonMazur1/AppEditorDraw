//
//  ImageViewModel.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import Foundation

protocol AccessViewModelProtocol {
    func getImage(completion: @escaping() -> ())
    func passPhotosToPhotosView() -> PhotosViewModelProtocol?
}

class AccessViewModel: AccessViewModelProtocol {
    var libraryImages: [Data]?
    
    func getImage(completion: @escaping() -> ()) {
        ImageService.shared.requestPermissionAndConvertPhoto { [unowned self] assets in
            libraryImages = assets
            completion()
        }
    }
    
    func passPhotosToPhotosView() -> PhotosViewModelProtocol? {
        PhotosViewModel(libraryImages: libraryImages)
    }
}
