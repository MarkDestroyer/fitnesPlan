//
//  SaveUserInfoViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 07.02.2022.
//

import UIKit
import RealmSwift

class SaveUserInfoViewController: UIViewController {

    
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var ChestDiameterTextField: UITextField!
    @IBOutlet weak var BeltDiameterTextField: UITextField!
    
    let realm = try! Realm()
    public var completionHandlerUser: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()       
    }
    
    @IBAction func Save(_ sender: Any) {
        didTapSaveButton()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @objc func didTapSaveButton() {
                if let text = WeightTextField.text, !text.isEmpty {
                    if let text2 = ChestDiameterTextField.text, !text2.isEmpty {
                        if let text3 = BeltDiameterTextField.text, !text3.isEmpty {
                            realm.beginWrite()
                            let newItem = User()
//                            newItem.weight =  Double(text) ?? 0
//                            newItem.chestdiameter = Double(text2) ?? 0
//                            newItem.beltdiameter = Double(text3) ?? 0
                            realm.add(newItem)
                            try! realm.commitWrite()

                            completionHandlerUser?()
                            navigationController?.popToRootViewController(animated: true)
                            print(realm.configuration.fileURL)
                        }
                    }
                }
            }
}
