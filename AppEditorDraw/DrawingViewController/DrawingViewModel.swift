//
//  DrawingViewModel.swift
//  AppEditorDraw
//
//  Created by Клоун on 13.10.2022.
//

import Foundation

protocol DrawingViewModelProtocol {
    var imageForMarkUp: Data { get }
    init(imageForMarkUp: Data)
}

class DrawingViewModel: DrawingViewModelProtocol {
    var imageForMarkUp: Data
    
    required init(imageForMarkUp: Data) {
        self.imageForMarkUp = imageForMarkUp
    }
}
