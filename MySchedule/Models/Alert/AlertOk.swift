//
//  AlertOk.swift
//  MySchedule
//
//  Created by Полищук Александр on 31.08.2022.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)

        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}