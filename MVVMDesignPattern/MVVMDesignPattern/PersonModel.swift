//
//  PersonModel.swift
//  MVVMDesignPattern
//
//  Created by Ahmed Salem on 06/04/2023.
//

import Foundation

enum Gender{
    case male, female, unspecified
}
//Mark:- define the person model
struct Person {
    let name:String
    let birthDate:Date?
    let middleName:String?
    let address:String?
    let gender:Gender
    
    init(
        name: String,
        birthDate: Date? = nil,
        middleName: String? = nil,
        address: String? = nil,
        gender: Gender = .unspecified
    )
    {
        self.name = name
        self.birthDate = birthDate
        self.middleName = middleName
        self.address = address
        self.gender = gender
    }
}
