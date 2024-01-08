//
//  SportCollectionViewCell.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 03/01/24.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    
    static let indentifier: String = "SportCollectionViewCell"
    
    let sportCollectionViewCellScreen: SportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configContraints()
    }
    
    public func setupCell(data:Sport){
        self.sportCollectionViewCellScreen.imageView.image = UIImage(named: data.nameImage)
        self.sportCollectionViewCellScreen.sportName.text = data.name
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(){
        self.sportCollectionViewCellScreen.layer.borderWidth = 1.0
        self.sportCollectionViewCellScreen.layer.borderColor = UIColor.blue.cgColor
        self.sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportCollectionViewCellScreen)
    }
    
    func configContraints(){
        NSLayoutConstraint.activate([
            self.sportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.sportCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
