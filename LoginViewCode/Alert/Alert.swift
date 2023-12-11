//
//  Alert.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 11/12/23.
//

import Foundation
import UIKit

class Alert: NSObject{
    
    var controller:UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(titulo: String, mensagem: String, completion:(() -> Void)? = nil){
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cencelar = UIAlertAction(title: "Ok", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(cencelar)
        self.controller.present(alertController, animated: true, completion: nil)
        
    }
    
}
