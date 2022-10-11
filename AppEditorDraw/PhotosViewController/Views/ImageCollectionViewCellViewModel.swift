//
//  ImageCollectionViewCellViewModel.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import Foundation

protocol ImageCollectionViewCellViewModelProtocol {
    var libraryImage: Data { get }
    init(image: Data)
}

class ImageCollectionViewCellViewModel: ImageCollectionViewCellViewModelProtocol {
    private let image: Data
    
    var libraryImage: Data {
        image
    }
    
    required init(image: Data) {
        self.image = image
    }
}
