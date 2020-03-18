//
//  DFJsonToModel.swift
//  VoiceBook
//
//  Created by 梁展焯 on 2020/3/9.
//  Copyright © 2020 WatchVoice. All rights reserved.
//

import UIKit

class DFJsonKit{

    /// Json对象(数组/字典)转Model
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
    
    /// Json对象(数组/字典)转String
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
    
    /// Model转String
    static func modelToString<T:Codable>(obj:T)->String?{
        /*
        object->data->String
        */
        do{
            let data = try JSONEncoder().encode(obj)
            let string = String.init(data: data, encoding: String.Encoding.utf8)
            return string
        }catch{
            print(error)
            return nil
        }
    }

    /// String转Model
    static func stringToModel<T:Codable>(string:String,modelType:T.Type)->T?{
        /*
         String->data->model
         */
        do{
            let data = string.data(using: String.Encoding.utf8)!
            let model = try JSONDecoder().decode(modelType, from: data)
            return model
        }catch{
            print(error)
            return nil
        }
    }
    
    /// Model转Json对象(数组/字典)
    static func modelTojson<T:Codable>(obj:T)->Any?{
        do{
            let data = try JSONEncoder().encode(obj)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            return json
        }catch{
            print(error)
            return nil
        }
    }
}
