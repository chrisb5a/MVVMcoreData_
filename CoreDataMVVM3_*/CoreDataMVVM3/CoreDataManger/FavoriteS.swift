//
//  FavoriteS.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import CoreData

@objc(FavoriteS)
class FavoriteS: NSManagedObject
{
    @NSManaged var favImg: NSData!
    @NSManaged var name: String!
    @NSManaged var attrs: String!
    @NSManaged var isDelete: Date?
    @NSManaged var ids: String!
}

