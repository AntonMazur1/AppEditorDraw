//
//  ImageCollectionViewCell.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "imageCell"
    
    @IBOutlet weak var imageFromLibrary: UIImageView!
    
    var viewModel: ImageCollectionViewCellViewModelProtocol? {
        didSet {
            imageFromLibrary.image = UIImage(data: viewModel?.libraryImage ?? Data())
        }
    }
}
