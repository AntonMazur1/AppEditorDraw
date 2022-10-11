//
//  AccessViewController.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import UIKit

class AccessViewController: UIViewController {
    private let viewModel = AccessViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photosVC = segue.destination as? PhotosViewController else { return }
        photosVC.viewModel = viewModel.passPhotosToPhotosView() as! PhotosViewModel
    }
    
    @IBAction func accessButtonTapped(_ sender: UIButton) {
        getPhotosFromLibrary()
    }
    
    private func getPhotosFromLibrary() {
        viewModel.getImage { [weak self] in
            DispatchQueue.main.async {
                self?.performSegue(withIdentifier: "showPhotos", sender: nil)
            }
        }
    }
}
