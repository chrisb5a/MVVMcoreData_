//
//  ProgListTableCell.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import UIKit
import CoreData

class ProgListTableCell: UITableViewCell {
    
    static let reuseID = "\(ProgListTableCell.self)"
    
    

    lazy var MusicImageView: UIImageView =  {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "Mean_1")
        imageView.layer.cornerRadius = 5
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(14)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Info"
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.text = "Pokemon attributes"
        label.backgroundColor = .clear
        return label
    }()
    
//    lazy var progButton: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.titleLabel?.font = UIFont(name:"GillSans", size: 14)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Remove From Favorites", for: .normal)
//
//        button.setTitleColor(.white, for: .normal)
//        button.tintColor = .systemCyan
//        button.backgroundColor = .clear
//        button.addTarget(self, action: #selector(self.progButtonPressed), for: .touchUpInside)
//        return button
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init? (coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func setUpUI(){
        self.backgroundColor = .clear
        let hStack = UIStackView(axis: .horizontal , spacing: 8, distribution: .fill)
        let vStack = UIStackView(axis: .vertical , spacing: 8, distribution: .fill)
        
        vStack.addArrangedSubview(self.titleLabel)
        vStack.addArrangedSubview(self.overviewLabel)
        //vStack.addArrangedSubview(self.progButton)
        
        hStack.addArrangedSubview(self.MusicImageView)
        hStack.addArrangedSubview(vStack)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
        
    }
    func configure(){
        self.titleLabel.text = "Pokemon"
        self.overviewLabel.text = "Pokemon Description"
    }
//    func configure(Music_alVM: MusicModelType, index: Int){
//        //self.MusicImageView.image = UIImage(named: "Mean_1")
//        self.titleLabel.text = Music_alVM.AlbumTitle(for: index)
//        self.overviewLabel.text = "Attributes"
//        Music_alVM.musicImage(for: index) {ImageData in
//            guard let ImageData = ImageData else {
//                return
//            }
//
//            DispatchQueue.main.async{
//                self.MusicImageView.image = UIImage(data: ImageData)
//            }
//        }    }
    
    override func prepareForReuse(){
        self.titleLabel.text = "Pokemon"
        self.overviewLabel.text = "Pokemon Description"
        self.MusicImageView.image = UIImage(named: "Mean_1")
    }

}


