//
//  ViewController.swift
//  Create-Swift-JSON-Model
//
//  Created by YouXianMing on 16/8/28.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit
import Alamofire

private enum Example : Int {
    
    case CreateModelFromDictionary
    case CreateModelFromLocalFile
    case CreateModelFromAlamofire
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        performSelector(#selector(ViewController.event), withObject: nil, afterDelay: 0.5)
    }
    
    func event() {
        
        // Choose the example type.
        let example = Example.CreateModelFromLocalFile
        
        // The event.
        if example == .CreateModelFromDictionary {
            
            example_Dictionary()
            
        } else if example == .CreateModelFromLocalFile {
        
            example_JSONFile()
            
        } else if example == .CreateModelFromAlamofire {
            
            example_Alamofire()
        }
    }
    
    /**
     Use the dictionary to create model.
     */
    func example_Dictionary() {
        
        let JSONData = ["foo": "bar",
                        "baz": [["a": "b"], ["a": "b"]],
                        "qux": ["x": 1, "y": 2, "z": 3]]
        
        // Create model.
        CreateModel.WithData(JSONData, withRootModelName: "JSONModel")
        
        // Init model with data.
        let model = JSONModel(dictionary: JSONData as [String : NSObject])
        print(model)
    }
    
    /**
     Use the json file to create model.
     */
    func example_JSONFile() {
        
        if let filePath = Bundle.FilePath(byName: "data.json") {
            
            if let data = NSData(contentsOfFile: filePath)?.toListProperty() {
                
                // Create model.
                CreateModel.WithData(data)
                
                // Init model with data.
                let model = RootModel(dictionary: data as? [String : AnyObject])
                print(model)
            }
        }
    }
    
    /**
     Create model from Alamofire.
     */
    func example_Alamofire() {
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["userName": "YouXianMing", "age": 28, "city" : "BeiJin"]) .responseJSON { response in
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let _ = response.result.value {
                
                // Create model.
                CreateModel.WithData(response.result.value, withRootModelName: "AlamofireModel")
                
                // Init model with data.
                let model = AlamofireModel(dictionary: response.result.value as? [String : AnyObject])
                print(model)
            }
        }
    }
}

