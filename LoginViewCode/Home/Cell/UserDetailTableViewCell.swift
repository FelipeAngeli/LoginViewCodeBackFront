//
//  UserDetailTableViewCell.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 13/12/23.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let indentifier:String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.configConstrainstDescriptionCell()
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(self.userDetailView)
    }
    
    public func setUpCell(data:DataUser){
        self.userDetailView.nameLabel.text = data.name
        self.userDetailView.userImageView.image = UIImage(named: data.nameImage)
        
    }
    
    
    private func configConstrainstDescriptionCell(){
        self.userDetailView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
   
 
}
