//
//  Restaurant.swift.swift
//  SProj_v1
//
//  Created by Eugene on 27.11.2021.
//

import Foundation
import CoreData
import UIKit

struct Restaurant{
    var name: String?
    var type: String?
    var location: String?
    var image: NSData?
    var isVisited: Bool?
    let context: NSManagedObjectContext?
    init(context: NSManagedObjectContext){
        self.context = context
    }
}
