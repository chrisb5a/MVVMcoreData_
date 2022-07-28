//
//  DetailVc1.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import UIKit

class DetailVc1: UIViewController {
    
    var ImagePassed = UIImage()
    
    lazy var progImageView2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = ImagePassed
        return imageView
        
    }()
    
    lazy var Name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.setContentHuggingPriority(.required, for: .vertical)
//        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Album"
        //label.backgroundColor = .systemOrange
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray4
        
        
        self.setUpUI()
        

        // Do any additional setup after loading the view.
    }
    
    
    private func setUpUI() {
        
        let elementsStack = UIStackView(frame: .zero)
                elementsStack.translatesAutoresizingMaskIntoConstraints = false
                elementsStack.spacing = 5
                elementsStack.axis = .vertical
                elementsStack.distribution = .fillEqually
        
        let ImageStack = UIStackView(frame: .zero)
                ImageStack.translatesAutoresizingMaskIntoConstraints = false
                ImageStack.spacing = 5
                ImageStack.axis = .vertical
                ImageStack.distribution = .fillEqually
        
        ImageStack.addArrangedSubview(self.Name)
        ImageStack.addArrangedSubview(self.progImageView2)
        
        self.view.addSubview(ImageStack)
        ImageStack.bindToSuperView()
        
        
//        self.view.addSubview(self.progImageView2)
//
//
//
//        self.progImageView2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.progImageView2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//
//        self.progImageView2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 44).isActive = true
//
//        self.progImageView2.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        self.progImageView2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
