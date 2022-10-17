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
