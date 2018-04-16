//
//  Message.swift
//  Vehement
//
//  Created by Marcus Lewis on 04/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import Foundation

class Message {
    var _content: String
    var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
