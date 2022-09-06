//
//  ContactModel.swift
//  MySchedule
//
//  Created by Полищук Александр on 05.09.2022.
//

import UIKit
import RealmSwift

class ContactModel: Object {
    
    @Persisted var contactsName = "Unknown"
    @Persisted var contactsPhone = "Unknown"
    @Persisted var contactsMail = "Unknown"
    @Persisted var contactsType = "Unknown"
    @Persisted var contactsImage: Data?
}
