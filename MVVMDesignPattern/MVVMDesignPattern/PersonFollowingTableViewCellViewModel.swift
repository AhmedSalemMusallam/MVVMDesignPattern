//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVMDesignPattern
//
//  Created by Ahmed Salem on 06/04/2023.
//

import UIKit

class PersonFollowingTableViewCellViewModel
{
    let name: String
    let username: String
    var currentlyFollowing: Bool
    let image:UIImage?
    
    init(with personModel: Person) {
        self.name = personModel.name
        self.username = personModel.name
        self.currentlyFollowing = false
        self.image = UIImage(systemName: "person")
    }
}
