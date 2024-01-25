//
//  CustomLiveness3DInstructionView.swift
//  OILiveness3D_Example
//
//  Created by Vitor Souza on 14/12/22.
//  Copyright © 2022 Oiti. All rights reserved.
//

import UIKit
import OILiveness3D

class CustomLiveness3DInstructionView: UIView, Liveness3DCustomInstructionView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Liveness3DCustomInstructionView Protocol
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadFromNib()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadFromNib()
        setupViews()
    }
    
    private func loadFromNib() {
        let classType = type(of: self)
        let bundle = Bundle(for: classType)
        bundle.loadNibNamed("\(classType)", owner: self)
    }
    
    private func setupViews() {
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = bounds
        activityIndicator.startAnimating()
        activityIndicator.isHidden = true
        
        addSubview(view)
    }
    
    func changeLoadingVisibility(to visibility: OILiveness3D.Visibility) {
        switch visibility {
        case .displayed:
            activityIndicator.isHidden = false
        case .hidden:
            activityIndicator.isHidden = true
        @unknown default:
            activityIndicator.isHidden = true
            print("[CustomLiveness3DInstructionView] unknown case in changeLoadingVisibility(to:)")
        }
    }
}
