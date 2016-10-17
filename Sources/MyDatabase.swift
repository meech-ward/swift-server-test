//
//  Database.swift
//  WebTest
//
//  Created by Sam Meech-Ward on 2016-10-17.
//
//

import Foundation

fileprivate let codes = ["code1", "code2"]

enum CodeError: Error {
    case codeNotFound
}

class MyDatabase {
    
    func useCode(code: String) throws {
        
        guard codes.contains(code) else {
            throw CodeError.codeNotFound
        }
        
    }
    
}
