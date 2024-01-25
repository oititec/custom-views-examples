//
//  CustomLiveness3DCameraPermissionView.swift
//  OILiveness3D_Example
//
//  Created by Vitor Souza on 14/12/22.
//  Copyright © 2022 Oiti. All rights reserved.
//

import UIKit
import OILiveness3D

class CustomLiveness3DCameraPermissionView: UIView, CustomCameraPermissionView {
    @IBOutlet weak var view: UIView!
    
    // MARK: Liveness3DCustomCameraPermissionView Protocol
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var checkPermissionButton: UIButton!
    @IBOutlet weak var openSettingsButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
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
        
        hiddenBottomSheetButtons(true)
        
        addSubview(view)
    }
    
    func showBottomSheet(visibility: OILiveness3D.Visibility) {
        switch visibility {
        case .displayed:
            hiddenBottomSheetButtons(false)
        case .hidden:
            hiddenBottomSheetButtons(true)
        @unknown default:
            hiddenBottomSheetButtons(true)
            print("[CustomLiveness3DCameraPermissionView] unknown case in showBottomSheet(visibility:)")
        }
    }
    
    private func hiddenBottomSheetButtons(_ hiddenValue: Bool) {
        openSettingsButton.isHidden = hiddenValue
        closeButton.isHidden = hiddenValue
    }
}
