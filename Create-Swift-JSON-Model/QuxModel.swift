//
//  QuxModel.swift
//
//  http://www.cnblogs.com/YouXianMing/
//  https://github.com/YouXianMing
//
//  Copyright (c) YouXianMing All rights reserved.
//

import Foundation

// MARK: [Class] QuxModel

class QuxModel: NSObject {
    
    // MARK: Stored propeties.
    //-----------------------------------------------------------------------------
    
    var y : NSNumber?
    var x : NSNumber?
    var z : NSNumber?

    // MARK: Init methods.
    //-----------------------------------------------------------------------------
    
    /**
     Init with dictionary.
     
     - parameter dictionary: The json data dictionary.
     
     - returns: The instance.
     */
    init?(dictionary : [String : AnyObject]?) {
        
        super.init()
        if let _ : [String : AnyObject] = dictionary { setValuesForKeysWithDictionary(dictionary!) } else { return nil}
    }
    
    /**
     Override init.
     
     - returns: The instance.
     */
    override init() {
        
        super.init()
    }
    
    // MARK: SetValueForKey & setValueForUndefinedKey.
    //-----------------------------------------------------------------------------
    
    /**
     Sets the property of the receiver specified by a given key to a given value.
     
     - parameter value: The value for the property identified by key.
     - parameter key:   The name of one of the receiver's properties.
     */
    override func setValue(value: AnyObject?, forKey key: String) {
        
        // To ignore Null value.
        guard value != nil else {
            
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
    /**
     Invoked by setValue:forKey: when it finds no property for a given key.
     
     - parameter value: The value for the key identified by key.
     - parameter key:   A string that is not equal to the name of any of the receiver's properties.
     */
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        // [Example] change property 'id' to 'userId'.
        //
        // if key == "id" {
        //
        //     userId = value as? NSNumber
        //     return
        // }
        
        print("[‼️] The file '\(self.classForCoder).swift' has an undefined key '\(key)', and the key's type is \(value?.classForCoder).")
    }
}
