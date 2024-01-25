//
//  CustomDocumentscopyResultView.swift
//  SampleFaceCaptcha
//
//  Created by Filipe Marques on 26/01/23.
//

import UIKit
import OILiveness2D

class CustomDocumentscopyResultView: UIView, DocumentscopyCustomResultView {
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var view: UIView!
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func display(for resultType: OILiveness2D.DocumentscopyResultType) {
        resultButton.isHidden = true
        switch resultType {
        case .success:
            titleLabel.text = "Sucesso"
        case .tryAgain:
            resultButton.isHidden = false
            titleLabel.text = "Tente Novamente"
        case .error(let error):
            titleLabel.text = "Erro: \(error)"
        @unknown default:
            break
        }
    }
}
