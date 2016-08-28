//
//  Bundle.swift
//  Swift-Alamofire
//
//  Created by YouXianMing on 16/8/23.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class Bundle: NSObject {

    /**
     Get the bundle file path name.
     
     - parameter name: The file name.
     
     - returns: The bundle file path.
     */
    class func FilePath(byName name : String) -> String? {
        
        return NSBundle.mainBundle().pathForResource(name, ofType: nil)
    }
}
