//
//  CloudManager.swift
//  BingoApp
//
//  Created by Zakk Hoyt on 11/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import UIKit
import CoreLocation
import CloudKit
import MapKit

protocol CloudManagerDelegate {
    func errorUpdating(error: NSError)
    func modelUpdated()
}

class CloudManager: NSObject {
    var delegate: CloudManagerDelegate? = nil
    let container : CKContainer
    let publicDB : CKDatabase
    let privateDB : CKDatabase
    var players:[AnyObject]
    var games:[AnyObject]
    
    override init() {
        container = CKContainer.defaultContainer()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
        players = []
        games = []
        super.init()
    }
    
    func fetchEstablishments(location:CLLocation,
        radiusInMeters:CLLocationDistance) {

            let radiusInKilometers = radiusInMeters / 1000.0

            let locationPredicate = NSPredicate(format: "distanceToLocation:fromLocation:(%K,%@) < %f",
                "Location",
                location,
                radiusInKilometers)
            let query = CKQuery(recordType: "Player",
                predicate:  locationPredicate)

            
            publicDB.performQuery(query, inZoneWithID: nil) {
                results, error in
                if error != nil {
                    print("error")
                    dispatch_async(dispatch_get_main_queue()) {
                        self.delegate?.errorUpdating(error!)
                        return
                    }
                } else {
                    self.players.removeAll(keepCapacity: true)
                    for record in results!{
                        let establishment = Player(record: record, database: self.publicDB)
                        self.players.append(establishment)
                    }
                    dispatch_async(dispatch_get_main_queue()) {
                        self.delegate?.modelUpdated()
                        return
                    }
                }
            }
    }
    
    func fetchPlayers() {
        
        let locationPredicate = NSPredicate(format: "Name != ''")
        
        let query = CKQuery(recordType: "Player", predicate:  locationPredicate)

        publicDB.performQuery(query, inZoneWithID: nil) {
            results, error in
            if error != nil {
                print("error")
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.errorUpdating(error!)
                    return
                }
            } else {
                self.players.removeAll(keepCapacity: true)
                for record in results!{
                    let establishment = Player(record: record, database: self.publicDB)
                    self.players.append(establishment)
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.modelUpdated()
                    return
                }
            }
        }
    }
    
    func fetchGames() {
        
        let predicate = NSPredicate(format: "Title != ''")
        
        let query = CKQuery(recordType: "Game", predicate:  predicate)
        
        publicDB.performQuery(query, inZoneWithID: nil) {
            results, error in
            if error != nil {
                print("error")
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.errorUpdating(error!)
                    return
                }
            } else {
                self.games.removeAll(keepCapacity: true)
                for record in results!{
                    let establishment = Game(record: record, database: self.publicDB)
                    self.games.append(establishment)
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate?.modelUpdated()
                    return
                }
            }
        }
    }

}
