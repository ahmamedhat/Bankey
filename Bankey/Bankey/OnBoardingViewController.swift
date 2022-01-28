//
//  OnBoardingViewController.swift
//  Bankey
//
//  Created by Ahmad Medhat on 28/01/2022.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    init(labelText: String , imageName: String) {
        self.labelText = labelText
        self.imageName = imageName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    var labelText: String
    var imageName: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
    }
}


extension OnBoardingViewController {
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
    }
    
    func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
    }
    
}
