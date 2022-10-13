//
//  DrawingViewController.swift
//  AppEditorDraw
//
//  Created by Клоун on 13.10.2022.
//

import PencilKit
import UIKit

class DrawingViewController: UIViewController {
    let toolPicker = PKToolPicker()
    
    var viewModel: DrawingViewModelProtocol!
    
    @IBOutlet weak var drawingView: PKCanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawingView.insertSubview(canvasImageView, at: 1)
        drawingView.delegate = self
        drawingView.drawingPolicy = .anyInput
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupDrawingView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private func setupDrawingView() {
        toolPicker.setVisible(true, forFirstResponder: drawingView)
        toolPicker.addObserver(drawingView)
        drawingView.becomeFirstResponder()
    }
}

//MARK: -PKCanvasViewDelegate
extension DrawingViewController: PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        
    }
    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
        
    }
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        
    }
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        
    }
}
