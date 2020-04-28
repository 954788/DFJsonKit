//
//  DFJsonToModel.swift
//  VoiceBook
//
//  Created by Fatm on 2020/3/9.
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
         jsonObject->data->string
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
         model->data->string
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
    
    /// Model转Json对象(数组/字典)
    static func modelToJsonObject<T:Codable>(obj:T)->Any?{
        /*
         model->data->jsonObject
         */
        do{
            let data = try JSONEncoder().encode(obj)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            return json
        }catch{
            print(error)
            return nil
        }
    }
    
    /// Model转Data
    static func modelToData<T:Codable>(obj:T)->Data?{
        /*
         model->data
         */
        do{
            let data = try JSONEncoder().encode(obj)
            return data
        }catch{
            print(error)
            return nil
        }
    }
    
    /// Data转Model
    static func dataToModel<T:Codable>(data:Data,modelType:T.Type)->T?{
        /*
         data->model
         */
        do{
            let model = try JSONDecoder().decode(modelType, from: data)
            return model
        }catch{
            print(error)
            return nil
        }
    }
    
    /// String转Model
    static func stringToModel<T:Codable>(string:String,modelType:T.Type)->T?{
        /*
         string->data->model
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
}
