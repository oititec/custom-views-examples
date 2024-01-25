//
//  CustomDocumentscopyView.swift
//  SampleFaceCaptcha
//
//  Created by Filipe Marques on 26/01/23.
//

import UIKit
import OILiveness2D

class CustomDocumentscopyView: UIView, DocumentscopyCustomView {
    @IBOutlet weak var cameraMask: UIView!
    @IBOutlet weak var frontIndicatorView: UIView!
    @IBOutlet weak var backIndicatorView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var cameraPreview: CameraPreviewView!
    @IBOutlet weak var cameraVisualizer: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var usePictureButton: UIButton!
    @IBOutlet weak var takeNewPictureButton: UIButton!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    func displayConfirmationSheet(visibility: OILiveness2D.Visibility, animated: Bool) { }

    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("\(type(of: self))", owner: self)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    func setFocus(to focusElement: OILiveness2D.FocusIndicator, animated: Bool) {
        switch focusElement {
        case .front:
            frontIndicatorView.backgroundColor = .green
            backIndicatorView.backgroundColor = .red
        case .back:
            frontIndicatorView.backgroundColor = .red
            backIndicatorView.backgroundColor = .green
        @unknown default:
            break
        }
    }
    
    func setUsePictureButtonTitle(to newTitle: String) {
        usePictureButton.setTitle(newTitle, for: .normal)
    }
}
