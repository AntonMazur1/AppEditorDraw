//
//  PhotosViewController.swift
//  AppEditorDraw
//
//  Created by Клоун on 11.10.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    var viewModel: PhotosViewModelProtocol!
}

//MARK: -UICollectionViewDelegate, UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        cell.viewModel = viewModel.getImageCellViewModel(at: indexPath)
        return cell
    }
}
