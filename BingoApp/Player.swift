//
//  Player.swift
//  BingoApp
//
//  Created by Zakk Hoyt on 11/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import UIKit
import MapKit
import CloudKit


class Player : NSObject, MKAnnotation {
    
    var record : CKRecord!
    var name : String!
    var location : CLLocation!
    weak var database : CKDatabase!
    
    var assetCount = 0
    
    //    var healthyChoice : Bool {
    //        get {
    //            return record.objectForKey("HealthyOption").boolValue
    //        }
    //    }
    //
    //    var kidsMenu: Bool {
    //        get {
    //            return record.objectForKey("KidsMenu").boolValue
    //        }
    //    }
    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        
        self.name = record.objectForKey("Name") as! String
        self.location = record.objectForKey("Location") as! CLLocation
    }
    
    //    func fetchRating(completion: (rating: Double, isUser: Bool) -> ()) {
    //        Model.sharedInstance().userInfo.userID() { userRecord, error in
    //            self.fetchRating(userRecord, completion: completion)
    //        }
    //    }
    //
    //    func fetchRating(userRecord: CKRecordID!, completion: (rating: Double, isUser: Bool) -> ()) {
    //        //REPLACE THIS STUB
    //        completion(rating: 0, isUser: false)
    //    }
    //
    //    func fetchNote(completion: (note: String!) -> ()) {
    //        Model.sharedInstance().fetchNote(self) { note, error in
    //            completion(note: note)
    //        }
    //    }
    //
    //    func fetchPhotos(completion:(assets: [CKRecord]!)->()) {
    //        let predicate = NSPredicate(format: "Establishment == %@", record)
    //        let query = CKQuery(recordType: "EstablishmentPhoto", predicate: predicate);
    //        //Intermediate Extension Point - with cursors
    //        database.performQuery(query, inZoneWithID: nil) { results, error in
    //            if error == nil {
    //                self.assetCount = results.count
    //            }
    //            completion(assets: results as! [CKRecord])
    //        }
    //    }
    //
    //    func changingTable() -> ChangingTableLocation {
    //        let changingTable = record?.objectForKey("ChangingTable") as? NSNumber
    //        var val:UInt = 0;
    //        if let changingTableNum = changingTable {
    //            val = changingTableNum.unsignedLongValue
    //        }
    //        return ChangingTableLocation(rawValue: val)
    //    }
    //
    //    func seatingType() -> SeatingType {
    //        let seatingType = record?.objectForKey("SeatingType") as? NSNumber
    //        var val:UInt = 0;
    //        if let seatingTypeNum = seatingType {
    //            val = seatingTypeNum.unsignedLongValue
    //        }
    //        return SeatingType(rawValue: val)
    //    }
    //
    //    func loadCoverPhoto(completion:(photo: UIImage!) -> ()) {
    //        //replace this stub
    //        completion(photo: nil)
    //    }
    //
    //MARK: - map annotation
    
    var coordinate : CLLocationCoordinate2D {
        get {
            return location.coordinate
        }
    }
    var title : String? {
        get {
            return name
        }
    }
}