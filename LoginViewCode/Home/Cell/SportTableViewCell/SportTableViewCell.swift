//
//  SportTableViewCell.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 03/01/24.
//

import UIKit

class SportTableViewCell: UITableViewCell {

    var sportTableViewCellScreen:SportTableViewCellScreen = SportTableViewCellScreen()
    var data:[Sport] = []
    
    static let identifier: String = "SportTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.configConstraints()
        self.sportTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func addSubView() {
        self.contentView.addSubview(self.sportTableViewCellScreen)
    }
    
    
    public func dataCollection(data:[Sport]){
        self.data = data
    }
    
    func configConstraints(){
        self.sportTableViewCellScreen.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.indentifier, for: indexPath) as? SportCollectionViewCell
        cell?.setupCell(data: self.data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    }

}
