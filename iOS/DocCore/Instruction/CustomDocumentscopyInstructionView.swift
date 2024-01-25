//
//  CustomDocumentscopyInstructionView.swift
//  SampleFaceCaptcha
//
//  Created by Filipe Marques on 26/01/23.
//

import UIKit
import OILiveness2D

class CustomDocumentscopyInstructionView: UIView, DocumentscopyCustomInstructionView {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var viewCNH: UIView!
    @IBOutlet weak var viewRG: UIView!
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        
        bundle.loadNibNamed("\(type(of: self))", owner: self, options: nil)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    func changeLoadingVisibility(to visibility: OILiveness2D.Visibility) { }
}
