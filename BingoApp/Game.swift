//
//  Game.swift
//  BingoApp
//
//  Created by Zakk Hoyt on 11/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import UIKit
import MapKit
import CloudKit


class Game: NSObject {
    var record : CKRecord!
    var title : String!
    var cells : [String]
    weak var database : CKDatabase!

    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        
        self.title = record.objectForKey("Title") as! String
        self.cells = record.objectForKey("Cells") as! [String]
    }

}
