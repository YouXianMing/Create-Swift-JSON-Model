//
//  NSData+JSONData.swift
//  Swift-Alamofire
//
//  Created by YouXianMing on 16/8/23.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import Foundation

extension NSData {
    
    /**
     Transform to array or dictionary.
     
     - returns: Array or dictionary.
     */
    func toListProperty() -> AnyObject? {
        
        guard let data = try? NSJSONSerialization.JSONObjectWithData(self, options: .MutableLeaves) else {
            
            return nil
        }
        
        return data
    }
}

extension String {
    
    /**
     Transform to array or dictionary.
     
     - returns: Array or dictionary.
     */
    func toListProperty() -> AnyObject? {
        
        guard let jsonData = self.dataUsingEncoding(NSUTF8StringEncoding) else {
        
            return nil
        }
        
        guard let data = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableLeaves) else {
        
            return nil
        }
        
        return data
    }
}

extension Dictionary {

    /**
     Transform to json string.
     
     - returns: Json string.
     */
    func toJsonString() -> String? {
        
        guard let data = try? NSJSONSerialization.dataWithJSONObject(self as! AnyObject, options: .PrettyPrinted) else {
        
            return nil
        }
        
        guard let string = String(data: data, encoding: NSUTF8StringEncoding) else {
        
            return nil
        }
        
        return string
    }
    
    /**
     Transform to json data.
     
     - returns: Json data.
     */
    func toJsonData() -> NSData? {
        
        guard let data = try? NSJSONSerialization.dataWithJSONObject(self as! AnyObject, options: .PrettyPrinted) else {
            
            return nil
        }
        
        return data
    }
}

extension Array {

    /**
     Transform to json string.
     
     - returns: Json string.
     */
    func toJsonString() -> String? {
        
        guard let data = try? NSJSONSerialization.dataWithJSONObject(self as! AnyObject, options: .PrettyPrinted) else {
            
            return nil
        }
        
        guard let string = String(data: data, encoding: NSUTF8StringEncoding) else {
            
            return nil
        }
        
        return string
    }
    
    /**
     Transform to json data.
     
     - returns: Json data.
     */
    func toJsonData() -> NSData? {
        
        guard let data = try? NSJSONSerialization.dataWithJSONObject(self as! AnyObject, options: .PrettyPrinted) else {
            
            return nil
        }
        
        return data
    }
}

