//
//  EJBlocksList.swift
//  EditorJSKit_Example
//
//  Created by Ivan Glushko on 12/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

///
public struct EJBlocksList: Decodable {
    let time: Int
    let blocks: [EJAbstractBlock]
    let version: String
    
    enum CodingKeys: String, CodingKey {
        case time, blocks, version
    }
    
    // TODO: Introduce FailableDecodable
    // https://stackoverflow.com/questions/46344963/swift-jsondecode-decoding-arrays-fails-if-single-element-decoding-fails
    // In order to prevent exceptions if only some of blocks were unable to be parsed
}
