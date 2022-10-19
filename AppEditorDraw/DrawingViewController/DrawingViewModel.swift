//
//  DrawingViewModel.swift
//  AppEditorDraw
//
//  Created by Клоун on 13.10.2022.
//

import Foundation

protocol DrawingViewModelProtocol {
    var imageForMarkUp: Data { get }
    var libraryImage: [Data] { get }
    var imageIndex: Int { get }
    func saveEdited(image: Data, completion: @escaping() -> ())
    func createPhotosViewModel(with image: Data) -> PhotosViewModelProtocol?
    init(imageForMarkUp: Data, libraryImage: [Data], imageIndex: Int)
}

class DrawingViewModel: DrawingViewModelProtocol {
    var imageForMarkUp: Data
    var libraryImage: [Data]
    var imageIndex: Int
    
    required init(imageForMarkUp: Data, libraryImage: [Data], imageIndex: Int) {
        self.imageForMarkUp = imageForMarkUp
        self.libraryImage = libraryImage
        self.imageIndex = imageIndex
    }
    
    func saveEdited(image: Data, completion: @escaping() -> ()) {
        libraryImage[imageIndex] = image
        completion()
    }
    
    func createPhotosViewModel(with image: Data) -> PhotosViewModelProtocol? {
        PhotosViewModel(libraryImages: libraryImage)
    }
}
