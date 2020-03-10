//
//  DFJsonToModel.swift
//  VoiceBook
//
//  Created by 梁展焯 on 2020/3/9.
//  Copyright © 2020 WatchVoice. All rights reserved.
//

import UIKit

class DFJsonKit{

    /// Json对象转Model
    static func jsonToModel<T:Codable>(withJSONObject obj:Any?,modelType:T.Type)->T?{
        /*
        jsonObject->data->model
        */
        
        guard let obj = obj else {
            return nil
        }
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: obj as Any, options:[])
            let model = try JSONDecoder().decode(modelType, from: jsonData)
            return model
        }catch{
            print(error)
            return nil
        }
    }
    
    /// Json对象转String
    static func jsonToString(withJSONObject obj:Any?)->String?{
        /*
         jsonObject->data->String
         */
        guard let obj = obj else {
            return nil
        }
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: obj as Any, options:[])
            let string = String.init(data: jsonData, encoding: String.Encoding.utf8)
            return string
        }catch{
            print(error)
            return nil
        }
    }
}
