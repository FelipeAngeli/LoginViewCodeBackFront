//
//  HomeVC.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 13/12/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen:HomeScreen?
    var dataUser:[DataUser] = [DataUser(name: "Caio", nameImage: "menino1"),
                           DataUser(name: "Felipe", nameImage: "menino2"),
                           DataUser(name: "Gabi", nameImage: "menina1"),]
    
    var dataSport:[Sport] = [Sport(name: "Corrida", nameImage: "corrida"),
                             Sport(name: "Ciclismo", nameImage: "ciclismo"),
                             Sport(name: "Natação", nameImage: "ciclismo"),
                             Sport(name: "Yoga", nameImage: "yoga"),
    ]
    
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    


}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell:SportTableViewCell = (tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell)! 
            cell.dataCollection(data: self.dataSport)
            return cell
        }
        
        let cell:UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.indentifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
