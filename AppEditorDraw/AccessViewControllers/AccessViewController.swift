//
//  AccessViewController.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import UIKit

class AccessViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = AccessViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotosFromLibrary()
    }
    
    private func getPhotosFromLibrary() {
        viewModel.getImage { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

//MARK: -UICollectionViewDelegate, UICollectionViewDataSource
extension AccessViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
