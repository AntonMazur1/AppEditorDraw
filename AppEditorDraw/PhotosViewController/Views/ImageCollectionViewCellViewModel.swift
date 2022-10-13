//
//  ImageCollectionViewCellViewModel.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import Foundation

protocol ImageCollectionViewCellViewModelProtocol {
    var libraryImage: Data { get }
    init(libraryImage: Data)
}

class ImageCollectionViewCellViewModel: ImageCollectionViewCellViewModelProtocol {
    var libraryImage: Data
    
    required init(libraryImage: Data) {
        self.libraryImage = libraryImage
    }
}
