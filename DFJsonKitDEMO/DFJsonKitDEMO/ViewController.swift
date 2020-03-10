//
//  ViewController.swift
//  DFJsonKitDEMO
//
//  Created by 梁展焯 on 2020/3/10.
//  Copyright © 2020 梁展焯. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        class Model:NSObject,Codable{
            var name: String?
            var age: Int?
        }
        
        let jsonObject:[String:Any] = ["name":"xiaohua","age":23]
        
        let model = DFJsonKit.jsonToModel(withJSONObject: jsonObject, modelType: Model.self)
        print(model?.name ?? "")
    }
}

