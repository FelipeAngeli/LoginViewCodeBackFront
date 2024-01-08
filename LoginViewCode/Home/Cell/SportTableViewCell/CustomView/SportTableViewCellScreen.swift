//
//  SportTableViewCellScreen.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 03/01/24.
//

import UIKit

class SportTableViewCellScreen: UIView {

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .none
        collectionView.delaysContentTouches = false
        collectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: SportCollectionViewCell.indentifier)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configConstrainstCollectionView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsCollectionView( delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
    
     func addSubview() {
         self.addSubview(collectionView)
    }
    
//    func configConstraints(){
//        NSLayoutConstraint.activate([
//            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
//            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
//            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
//            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//        ])
//    }
    
    //snapkit
    func configConstrainstCollectionView(){
        self.collectionView.snp.makeConstraints{make in 
            make.edges.equalToSuperview()
        }
    }
    
}


