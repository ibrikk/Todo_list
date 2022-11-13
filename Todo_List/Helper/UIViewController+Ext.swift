//
//  UIViewController+Ext.swift
//  Todo_List
//
//  Created by Ibrahim Khalilov on 2022-11-13.
//

import UIKit

extension UIViewController {
    func alertWithTextField(with title: String,
                           _ message: String,
                           _ actionButtonTitle: String,
                           _ cancelButtonTitle: String,
                           _ placeholder: String,
                           _ completion: @escaping (String)-> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = placeholder
        }
        let actionButton = UIAlertAction(title: actionButtonTitle, style: .default) { action in
            completion(alertController.textFields?[0].text ?? "")
        }
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
            alertController.addAction(actionButton)
            alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
}
