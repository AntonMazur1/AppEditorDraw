//
//  PhotosViewController.swift
//  AppEditorDraw
//
//  Created by Клоун on 11.10.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    var viewModel: PhotosViewModelProtocol!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let drawingVC = segue.destination as? DrawingViewController else { return }
        drawingVC.viewModel = sender as! DrawingViewModel
    }
}

//MARK: -UICollectionViewDelegate, UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let drawingViewModel = viewModel.getImageForEdit(at: indexPath)
        performSegue(withIdentifier: "showEditor", sender: drawingViewModel)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        cell.viewModel = viewModel.getImageCellViewModel(at: indexPath)
        return cell
    }
}
