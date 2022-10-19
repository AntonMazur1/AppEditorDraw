//
//  DrawingViewController.swift
//  AppEditorDraw
//
//  Created by Клоун on 13.10.2022.
//

import PencilKit
import UIKit

class DrawingViewController: UIViewController {
    @IBOutlet weak var drawingView: PKCanvasView!
    @IBOutlet weak var drawingImageView: UIImageView!
    
    private let toolPicker = PKToolPicker()
    var viewModel: DrawingViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageAndImageView()
        drawingView.delegate = self
        drawingView.drawingPolicy = .anyInput
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDrawingView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let photosVC = segue.destination as? PhotosViewController
        photosVC?.viewModel = sender as! PhotosViewModel
        photosVC?.imageCollectionView.reloadData()
    }
    
    @IBAction func saveEditedImageTapped(_ sender: Any) {
        saveImage()
    }
    
    private func saveImage() {
        let generatedImage = generateImageFromCanvas()
        
        if let image = generatedImage?.pngData() {
            viewModel.saveEdited(image: image) { [weak self] in
                let photosViewModel = self?.viewModel.createPhotosViewModel(with: image)
                self?.performSegue(withIdentifier: "backToPhotos", sender: photosViewModel)
            }
        }
    }
    
    private func generateImageFromCanvas() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(drawingView.bounds.size, false, 1)
        
        drawingView.drawHierarchy(in: CGRect(origin: .zero, size: drawingView.bounds.size), afterScreenUpdates: true)
        let generatedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return generatedImage
    }
    
    private func setupDrawingView() {
        toolPicker.overrideUserInterfaceStyle = .dark
        toolPicker.setVisible(true, forFirstResponder: drawingView)
        toolPicker.addObserver(drawingView)
        drawingView.isOpaque = false
        drawingView.backgroundColor = .clear
        drawingView.becomeFirstResponder()
    }
    
    private func setupImageAndImageView() {
        if let image = UIImage(data: viewModel.imageForMarkUp) {
            let imageView = UIImageView(image: image)
            imageView.clipsToBounds = true
            imageView.frame = drawingView.bounds
            imageView.contentMode = .scaleAspectFill
            let subView = drawingView.subviews[0]
            subView.addSubview(imageView)
            subView.sendSubviewToBack(imageView)
        }
    }
}

//MARK: - PKCanvasViewDelegate
extension DrawingViewController: PKCanvasViewDelegate {

}
